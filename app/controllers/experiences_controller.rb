require 'pry'
require 'net/http'
class ExperiencesController < ApplicationController
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
      @experiences = get_search_results(params[:search])
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

  def get_search_results(keyword)
    results = []
    PgSearch.multisearch(keyword).each do |object|
      if object.searchable_type == "Dish"
        results << object.searchable.experience unless results.include?(object.searchable.experience)
      elsif object.searchable_type == "User"
        results += object.searchable.experiences
      elsif object.searchable_type == "Experience"
        results << object.searchable
      end
    end
    Dish.venue_search(keyword).each do |object|
      results << object.experience unless results.include?(object.experience)
    end
    return results
  end
end
