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

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.title == params[:article][:title] && @article.description == params[:article][:description]
    elsif @article.title == params[:article][:title]
      @article.update(description: params[:article][:description])
    elsif @article.description == params[:article][:description]
      @article.update(title: params[:article][:title])
    else
      @article.update(title: params[:article][:title], description: params[:article][:description])
    end

    redirect_to article_path(@article)
  end
end
