class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article has been created."
      redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been created."
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article has been updated."
      redirect_to article_path(@article)
    else
      flash.now[:danger] = "Article failed to update."
      render :edit
    end
  end

  protected

  def resource_not_found
    message = "The article you are looking for could not be found."
    flash[:alert] = message
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
