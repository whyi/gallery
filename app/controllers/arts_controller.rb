class ArtsController < ApplicationController
	before_filter :store_prev_url, :only => [:index, :admin, :destroy]
	before_filter :authenticate_user_and_redirect, :only => [:new, :create, :destroy]
	before_filter :authenticate_user, :only => [:index, :show, :edit]

	def new
	end

	def destroy
		Art.find(params[:id]).destroy()
		redirect_to session.delete(:return_to)
	end	

	def create
	  @art = @current_user.arts.create!(art_params)
	  redirect_to @art
	end

	def update
	  @art = Art.find(params[:id])

  	if @art.update_attributes(art_params)
  		redirect_to session.delete(:return_to)
  	else
	  	render 'edit'
	  end
	end

	def edit
		@art = Art.find(params[:id])
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

	def admin
		if authenticate_user
			@arts = Art.find_all_by_category(params[:params])
		else
			redirect_to(:controller => 'sessions', :action => 'login')
		end
	end

	private
	  def art_params
	    params.require(:art).permit(:title, :description, :category_cd, :width, :height, :filename, :medium, :year)
	  end

	  def store_prev_url
	  	# bug : store if different
	  	# else bypass
	  	# how to?!@
			session[:return_to] ||= request.referer
			if session[:return_to] != request.referer
				session[:return_to] = request.referer
			end
		end
end
