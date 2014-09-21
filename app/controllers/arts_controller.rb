class ArtsController < ApplicationController
	before_filter :authenticate_user_and_redirect, :only => [:new, :create]
	before_filter :authenticate_user, :only => [:index, :show]

	def new
	end

	def create
	  @art = Art.new(art_params)
	  @art.process_uploaded_file(art_params[:filename])
	  @art.save
	  redirect_to @art
	end

	def index
		@arts = Art.all
		respond_to do |format|
			format.html
			format.json { render json: @arts }
		end
	end

	def show
	  @art = Art.find(params[:id])
	end

	private
	  def art_params
	    params.require(:art).permit(:title, :description, :category_cd, :width, :height, :filename, :medium, :year)
	  end
end
