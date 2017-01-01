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
    @article.update
    redirect_to account_article_path
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
    redirect_to account_article_path
  end
end
