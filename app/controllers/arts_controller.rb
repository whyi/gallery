class ArtsController < ApplicationController
	before_filter :store_prev_url, :only => [:index, :admin, :destroy]
	before_filter :authenticate_user_and_redirect, :only => [:new, :create]
	before_filter :authenticate_user, :only => [:index, :show, :edit, :delete]

	def new
	end

	def destroy
		Art.find(params[:id]).destroy()
		redirect_to session.delete(:return_to)
	end	

	def create
	  @art = Art.new(art_params)
	  #@art.process_uploaded_file(art_params[:filename])
	  @art.save
	  redirect_to @art
	end

	def update
	  @art = Art.find(params[:id])

	  file_updated = true

	  if file_updated
	  	art_params[:filename] = @art.filename
	  	# create a new art_params which has all data but filename
	  	# then assgin file name as art_params[:filename] = @art.filename
	  	foo = art_params
	  	foo[:filename] = @art.filename
	  	if @art.update_attributes(art_params)
	  		redirect_to session.delete(:return_to)
	  	end
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
