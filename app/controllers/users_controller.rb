class UsersController < ApplicationController

	def show
		@user = User.find_by(id: params[:id])
		respond_to do |format|
      format.html{render :layout => !request.xhr?}
    end
	end

	def following
	  @users = current_user.following
	  render 'show_following'
	end

	def followers
	  @users = current_user.followers
	  render 'show_followers'
	end

	def myfeed
		@following = current_user.following.map{|user|user.id}
		@experiences = Experience.where(:user_id => @following)
		render 'experiences/index'
	end

end