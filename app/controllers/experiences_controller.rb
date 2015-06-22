require 'pry'
require 'net/http'
class ExperiencesController < ApplicationController
  include ExperiencesHelper

	def show
		@experience = Experience.find_by(id: params[:id])
    respond_to do |format|
      format.html{render :layout => !request.xhr?}
    end
	end

  def index
    if params[:user]
      @experiences = Experience.where(user_id: params[:user])
    elsif params[:search]
      @experiences = ExperiencesHelper.get_search_results(params[:search])
    else
      @experiences = Experience.all.includes(:dishes)
    end
    respond_to do |format|
      format.html{render :layout => !request.xhr?}
    end
  end

  def new
    @experience = Experience.new
    @venue = Venue.new
    @experience.dishes.build
    respond_to do |format|
      format.html{render :layout => !request.xhr?}
    end
  end

  def create
    @venue = Venue.create_venue(params[:place_id])
    @experience = current_user.experiences.build(name: experience_params[:name])
    @dish = @experience.dishes.build(experience_params[:dish])
    @dish.venue = @venue
    if @venue.save && @experience.save && @dish.save
      redirect_to experiences_path
    else
      render :new
    end
  end

  def search
    redirect_to :action => "index", :search => params[:search]
  end

  def edit
    @experience = Experience.find_by(id: params[:id])
  end

  def destroy
    @experience = Experience.find_by(id: params[:id])
    @experience.destroy
    redirect_to experiences_path
  end

  private

  def experience_params
    params.require(:experience).permit(:name, dish: [:id, :title, :dishpicture, :review])
  end
end
