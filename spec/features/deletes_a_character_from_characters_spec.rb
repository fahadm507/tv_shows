
feature "delete a characters from the characters list", %Q{

  As a site visitor
I want to delete a character I don't like
So no one else will want to watch that character

Acceptance Criteria:
* I can delete a character from the database
* If the record is not successfully deleted, I receive an error message

} do

  scenario "user deletes character from characters list" do

    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO' )
    character = Character.create(name: "Batman", actor: "Fahad",
                                 description: "Great actor. The best ever. Oscar worthy.",
                                 television_show_id: show.id)
    visit '/characters'

    click_on('Destroy')

    expect(page).to have_content "The character has been successfully deleted"


  end
end

