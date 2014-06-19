require 'rails_helper'

feature "user views a TV show's details", %Q{
  * I can access a form to add a character on a TV show's page
  * I must specify the character's name and the actor's name
  * I can optionally provide a description
  * If I do not provide the required information, I receive an error message
  * If the character already exists in the database, I receive an error message
} do

  scenario "user inputs valid information for new character" do

   show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO' )

    visit "/television_shows/#{show.id}"

    fill_in('Name', with: 'Joe Bob')
    fill_in('Actor', with: 'Billy Bob')
    fill_in('Description', with: 'A test description')

    click_on('Create Character')

    expect(page).to have_content "Character successfully added"
    expect(page).to have_content "Name: Joe Bob"

  end

  scenario "user does not provide required information " do 
    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO' )

    visit "/television_shows/#{show.id}"

    fill_in('Name', with: 'Joe Bob')
    fill_in('Description', with: 'A test description')

    click_on('Create Character')

    expect(page).to have_content "There was an error!"
  end

  scenario "user tries to add a character already in the database" do 
    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO' )

    visit "/television_shows/#{show.id}"

    fill_in('Name', with: 'Joe Bob')
    fill_in('Actor', with: 'Billy Bob')
    fill_in('Description', with: 'A test description')

    click_on('Create Character')

    fill_in('Name', with: 'Joe Bob')
    fill_in('Actor', with: 'Billy Bob')
    fill_in('Description', with: 'A test description')

    click_on('Create Character')

    expect(page).to have_content "There was an error!"
  end
end
