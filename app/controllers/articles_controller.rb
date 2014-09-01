class ArticlesController < ApplicationController
	def new
	end

	def create
	  @article = Article.new(article_params)
	  @article.process_uploaded_file(article_params[:filename])
	  @article.save
	  redirect_to @article	  
	end

	def show
	  @article = Article.find(params[:id])
	end

	private
	  def article_params
	    params.require(:article).permit(:title, :description, :category_cd, :width, :height, :filename, :medium, :year)
	  end
end
