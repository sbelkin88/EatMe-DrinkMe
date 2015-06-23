require 'pry'
require 'net/http'
class ExperiencesController < ApplicationController
  include ExperiencesHelper # NO no no no -
  # The ExperiencesHelper is _not_ a helper regardless of what you've called it.
  # What you've made is a module.  You can either:
  # put it into the app/controllers/concerns directory and include/extend from there
  # or
  # in this case I think it makes more sense to have a model called "ExperienceSearch":
  #
  # class ExperienceSearch
  #   def self.get_search_results
  # ...
  # end
  #
  # There is no need to include this module in this controller, and its confusing
  # to the reader.  You are not actually including any methods, but rather just
  # using it as a namespace to call a class method.

	def show
		@experience = Experience.find_by(id: params[:id])
	end

  def index
    if params[:user]
      @experiences = Experience.includes(:dishes).where(user_id: params[:user])
    elsif params[:search]
      @experiences = ExperiencesHelper.get_search_results(params[:search])
    else
      @experiences = Experience.includes(:dishes).all
    end
  end

  def new
    @experience = Experience.new
    @venue = Venue.new
    @experience.dishes.build
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

  def update
    @experience = Experience.find_by(id: params[:id])
    # Change this to @experience.update()
    if @experience.update_attributes(name: experience_params[:name])
      redirect_to experience_path(@experience)
    else
      render :edit
    end
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
