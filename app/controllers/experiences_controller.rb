require 'pry'
class ExperiencesController < ApplicationController
	def show
		@experience = Experience.find_by(id: params[:id])
	end

  def index
    @experiences = Experience.all.includes(:dishes)
  end

  def new
    @experience = Experience.new
    @venue = Venue.new
    @experience.dishes.build
  end

  def create
    @venue = Venue.new(name: params[:venue], address: "Broadway", city: "New York", state: "NY", zip: "10024", phone: "212-222-2222", website: "www.nyc.com")
    if @venue.save
      @experience = User.first.experiences.build(venue: @venue)
      if @experience.save
        @dish = @experience.dishes.build(experience_params[:dish])
        if @dish.save
          redirect_to experiences_path
        else
          render :new
        end
      else
        render :new
      end
    else
      render :new
    end
  end

  private

  def experience_params
    params.require(:experience).permit(dish: [:id, :title, :pic_url, :review])
  end
end
