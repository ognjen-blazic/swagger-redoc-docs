# frozen_string_literal: true

class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'ogi', password: 'pwd', except: %i[index show]

  swagger_controller :articles, 'Articles Management'

  swagger_api :index do
    summary 'Fetches all articles'
    notes 'This lists all the articles'
    param :query, :page, :integer, :optional, 'Page number'
    response :unauthorized
    response :not_acceptable
  end

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
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
