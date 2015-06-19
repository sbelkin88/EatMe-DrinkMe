require 'pry'
class ExperiencesController < ApplicationController
	def show
		@experience = Experience.find_by(id: params[:id])
	end

  def index
    if params[:user]
      @experiences = Experience.where(user_id: params[:user])
    elsif params[:search]
      @experiences = []
      PgSearch.multisearch(params[:search]).each do |object|
        if object.searchable_type == "Dish"
          @experiences << object.searchable.experience unless @experiences.include?(object.searchable.experience)
        elsif object.searchable_type == "User"
          @experiences += object.searchable.experiences
        end
      end
      @experiences += Experience.venue_search(params[:search])
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

  def search
    redirect_to :action => "index", :search => params[:search]
  end

  private

  def experience_params
    params.require(:experience).permit(dish: [:id, :title, :dishpicture, :review])
  end
end
