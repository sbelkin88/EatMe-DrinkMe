class DishesController < ApplicationController

	def show
		@experience = Experience.find(params[:experience_id])
		@dish = Dish.find(params[:id])
	end

	def new
		@experience = Experience.find(params[:experience_id])
		@dish = Dish.new
    render layout: !request.xhr?
	end

	def create
    @venue = Venue.create_venue(params[:place_id])
		@experience = Experience.find(params[:experience_id])
		@dish = @experience.dishes.build(dish_params)
		@dish.venue = @venue
		if @venue.save && @dish.save
			redirect_to experiences_path
		else
			render :new
		end
	end

  def edit
    @dish = Dish.find_by(id: params[:id])
    @experience = @dish.experience
    if @experience.user == current_user
      render layout: !request.xhr?
    else
      flash[:alert] = "You are not authorized to edit this event"
      redirect_to experience_path(@experience)
    end
  end

  def update
    @dish = Dish.find_by(id: params[:id])
    @experience = @dish.experience
    if params[:place_id] != ""
      @venue = Venue.create_venue(params[:place_id])
      @dish.venue = @venue
    end
    @dish.update(dish_params)
    if @dish.save
      redirect_to experience_path(@experience)
    else
      render :edit
    end
  end

  def destroy
    @dish = Dish.find_by(id: params[:id])
    if @experience.user == current_user
      @dish.destroy
      redirect_to experiences_path
    else
      flash[:alert] = "You are not authorized to delete this event"
      redirect_to experience_path(@experience)
    end
  end

	private

	def dish_params
		params.require(:dish).permit(:dishpicture, :title, :review)
	end
end
