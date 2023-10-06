class ArticleController < ApplicationController
  def index
    @articles = Article.all 
    render json: @articles, status: :ok
  end

  def show
    @article = Article.find_by(id: params[:id])
    if @article.save  
      render json: @article,status: :ok 
    else 
      render json: {message: "id not found!"}, status: :unprocessable_entity 
    end 
  end

  def create
  end

  def update
  end
end
