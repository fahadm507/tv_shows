require 'spec_helper'

feature "user views a list of people's TV characters",  %Q{
  As a site visitor
I want to view a list of people's favorite TV characters
So I can find wonky characters to watch

Acceptance Criteria:
* I can see a list of all the characters
* The character's name and the TV show it is associated with are listed
} do 

  scenario "users sees a list of all characters" do 

    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO' )

    character_one = Character.create(name: "Batman", actor: "Fahad",
                 description: "plays like a star", television_show_id: show.id)
    character_two = Character.create(name: "Superman", actor: "John",
                 description: "plays like a star", television_show_id: show.id)

    visit '/characters'

    expect(page).to have_content "Character Name: Batman | Actor Name: Fahad | Description: plays like a star | Show: Game of Thrones"
    expect(page).to have_content "Character Name: Superman | Actor Name: John | Description: plays like a star | Show: Game of Thrones"
  end

end
