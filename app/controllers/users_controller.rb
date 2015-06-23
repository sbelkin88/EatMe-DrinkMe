class UsersController < ApplicationController
		## TABS!!!!
	def show
		# You call @user.experiences in your view.  You need to make sure you dont
		# make queries from your views, which this does in this case.  You should
		# add .include(:experiences) to ensure that eager loading is accomplished.
		@user = User.find_by(id: params[:id])
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
