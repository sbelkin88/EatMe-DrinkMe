class ExperiencesController < ApplicationController
	def show
		@experience = Experience.find_by(id: params[:id])
	end

  def index
    @experiences = Experience.all.includes(:dishes)
  end
end
