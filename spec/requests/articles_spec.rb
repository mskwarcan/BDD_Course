require 'rails_helper'

RSpec.feature "Article Routes", type: :request do
  before do
    @article = Article.create(title: "Test Article", body: "Test body copy")
  end

  describe 'GET /articles/:id' do
    context 'with existing article' do
      before { get "/articles/#{@article.id}"}

      it "handles existing article" do
        expect(response.status).to eq 200
      end
    end

    context 'with article that does exist' do
      before { get "/articles/132"}

      it "handles existing article" do
        expect(response.status).to eq 302
        flash_message = "The article you are looking for could not be found."
        expect(flash[:alert]).to eq flash_message
      end
    end
  end
end
