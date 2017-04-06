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
end
