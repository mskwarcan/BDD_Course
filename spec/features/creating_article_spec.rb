require "rails_helper"

RSpec.feature "Creating New Article" do
  scenario "A user creates a new article" do
    visit "/"
    click_link "New Article"
    fill_in "Title", with: "New Article"
    fill_in "Body", with: "This is an article about a new article."
    click_button "Create Article"

    expect(page).to have_content("Article has been created.")
    expect(page.current_path).to eq(articles_path)
  end

  scenario "A user fails to create an article" do
    visit "/"
    click_link "New Article"
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Create Article"

    expect(page).to have_content("Article has not been created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
