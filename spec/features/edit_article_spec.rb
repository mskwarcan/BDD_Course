require 'rails_helper'

RSpec.feature "Edit Article" do
  before do
    @article = Article.create(title: "Test Article", body: "This is the body copy.")
  end

  scenario "update an article" do
    visit "/"
    click_link @article.title
    click_link "Edit Article"
    fill_in "Title", with: "Updated Test Article Title"
    fill_in "Body", with: "This is some new copy."
    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(page).to have_content("Updated Test Article Title")
    expect(page).to have_content("This is some new copy.")
    expect(current_path).to eq article_path(@article)
  end

  scenario "fail to update an article" do
    visit "/"
    click_link @article.title
    click_link "Edit Article"
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Update Article"

    expect(page).to have_content("Article failed to update.")
    expect(page).to have_content("Body can't be blank")
    expect(page).to have_content("Title can't be blank")
    expect(current_path).to eq article_path(@article)
  end
end
