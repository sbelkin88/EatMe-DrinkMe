class ExperiencesController < ApplicationController

	def show
		@experience = Experience.find_by(id: params[:id])
	end


end
