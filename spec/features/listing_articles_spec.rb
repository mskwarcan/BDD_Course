require "rails_helper"
include ActionView::Helpers::TextHelper

RSpec.feature "Listing Artciles" do
  before do
    @article1 = Article.create(title: "Test Article One", body: "Example Body information")
    @article2 = Article.create(title: "Test Article Two", body: "Here is some body copy. Here is some body copy.  Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy.  Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy.  Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy.  Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy. Here is some body copy.")
  end

  scenario "show all user articles" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(truncate(@article1.body, length: 200))
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(truncate(@article2.body, length: 200))
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end

  scenario "show no articles" do
    Article.delete_all
    visit "/"

    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(truncate(@article1.body, length: 200))
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(truncate(@article2.body, length: 200))
    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_link(@article2.title)

    within('h1#no-articles') do
      expect(page).to have_content("This user does not have any content at the moment.")
    end
  end
end
