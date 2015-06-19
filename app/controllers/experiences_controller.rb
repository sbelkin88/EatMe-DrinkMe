require 'pry'
class ExperiencesController < ApplicationController
	def show
		@experience = Experience.find_by(id: params[:id])
	end

  def index
    if params[:user]
      @experiences = Experience.where(user_id: params[:user])
    else
      @experiences = Experience.all.includes(:dishes)
    end
  end

  def new
    @experience = Experience.new
    @venue = Venue.new
    @experience.dishes.build
  end

  def create
    @venue = Venue.new(name: params[:venue], address: "Broadway", city: "New York", state: "NY", zip: "10024", phone: "212-222-2222", website: "www.nyc.com")
    @experience = User.last.experiences.build(venue: @venue)
    @dish = @experience.dishes.build(experience_params[:dish])
    if @venue.save && @experience.save && @dish.save
      redirect_to experiences_path
    else
      render :new
    end
  end

  def show
    @experience = Experience.find_by(id: params[:id])
  end

  private

  def experience_params
    params.require(:experience).permit(dish: [:id, :title, :pic_url, :review])
  end
end
