class UsersController < ApplicationController

	def show
		@user = User.includes(:experiences).find_by(id: params[:id])
	end

	def following
		@user = User.find_by(id: params[:id])
	  @users = @user.following
	  render 'show_following'
	end

	def followers
		@user = User.find_by(id: params[:id])
	  @users = @user.followers
	  render 'show_followers'
	end

def myfeed
		@following = current_user.following.map{|user|user.id}
		@experiences = Experience.where(:user_id => @following)
		render 'experiences/index'
	end

end