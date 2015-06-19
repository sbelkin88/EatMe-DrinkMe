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
    @experience.dishes.build
  end

  def create
    @experience = Experience.new(experience_params)
    @dish = @experience.dishes.build(experience_params[:dish])
    binding.pry
    if @dish.save && @experience.save
      redirect_to experiences_path
    else
      render :new
    end
  end

  private

  def experience_params
    params.require(:experience).permit(:unique_place_id, dishes_attributes: [:id, :title, :pic_url, :review])
  end
end
