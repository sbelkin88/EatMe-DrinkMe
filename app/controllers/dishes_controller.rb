class DishesController < ApplicationController

	def show
		@dish = Dish.find(params[:id])
	end

	def new
		@experience = Experience.find(params[:experience_id])
		@dish = Dish.new
	end

	def create
		@experience = Experience.find(params[:experience_id])
		# byebug
		@dish = @experience.dishes.build(dish_params)
		if @dish.save
			redirect_to root_url
		end
	end

	private

		def dish_params
			params.require(:dish).permit(:dishpicture, :title, :review)
		end
end
