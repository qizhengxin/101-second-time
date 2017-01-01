class Account::ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = current_user.articles
  end



  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    @article.update(article_params)
    redirect_to account_articles_path
  end



  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
    redirect_to account_articles_path
  end


  private

  def article_params
    params.require(:article).permit(:content)
  end
end
