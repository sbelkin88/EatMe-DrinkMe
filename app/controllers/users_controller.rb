class UsersController < ApplicationController

	def show
		@user = User.find_by(id: params[:id])
		respond_to do |format|
      format.html{render :layout => !request.xhr?}
    end
	end

	def following
		@user = User.find_by(id: params[:id])
	  @users = @user.following
	  render 'show_following', layout: false if request.xhr?
	end

	def followers
		@user = User.find_by(id: params[:id])
	  @users = @user.followers
	  render 'show_followers', layout: false if request.xhr?
	end

def myfeed
		@following = current_user.following.map{|user|user.id}
		@experiences = Experience.where(:user_id => @following)
		render 'experiences/index', layout: false if request.xhr?
	end

end