class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @group = Group.find(params[:group_id])
    @article = Article.new
  end

  def create
    @group = Group.find(params[:group_id])
    @article = Article.new(article_params)
    @article.group = @group
    @article.user = current_user

    if @article.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:content)
  end
end
