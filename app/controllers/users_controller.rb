class UsersController < ApplicationController

	def show 
		@user = User.find_by(id: params[:id])
	end


	def following
	  @users = current_user.following
	  render 'show_follow'
	end

	def followers
	  @users = current_user.followers
	  render 'show_follow'
	end


	def myfeed
		@experiences = Experience.joins(user: :following)
		render 'experiences/index'
		# @followings = current_user.following.includes(:experiences)
		# @experiences = User.joins(following: )
		# Category.joins(articles: [{ comments: :guest }, :tags])
	end

end