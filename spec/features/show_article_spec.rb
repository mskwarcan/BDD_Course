require "rails_helper"

RSpec.feature "Show Article" do
  before do
    @article = Article.create(title: "Test Article One", body: "Example Body information")
  end

  scenario "show article title and body" do
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end
