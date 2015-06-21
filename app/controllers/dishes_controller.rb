class DishesController < ApplicationController

	def show
		@experience = Experience.find(params[:experience_id])
		@dish = Dish.find(params[:id])
	end

	def new
		@experience = Experience.find(params[:experience_id])
		@dish = Dish.new
	end

	def create
		place_id = params[:place_id]
    key = ENV["GOOGLE_KEY"]
    uri = URI.parse("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=#{key}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    place = JSON.parse(response.body)
    street_num = place["result"]["address_components"][0]["long_name"]
    street_address = place["result"]["address_components"][1]["long_name"]
    city = place["result"]["address_components"][2]["long_name"]
    state = place["result"]["address_components"][3]["short_name"]
    zip = place["result"]["address_components"][5]["long_name"]
    phone = place["result"]["formatted_phone_number"]
    website = place["result"]["website"]
    @venue = Venue.new(name: place["result"]["name"], address: "#{street_num} #{street_address}", city: city , state: state, zip: zip, phone: phone, website: website)
		@experience = Experience.find(params[:experience_id])
		@dish = @experience.dishes.build(dish_params)
		@dish.venue = @venue
		if @venue.save && @dish.save
			redirect_to experience_path(@experience)
		else
			render :new
		end
	end

  def destroy
    @dish = Dish.find_by(id: params[:id])
    @dish.destroy
    redirect_to experiences_path
  end

	private

	def dish_params
		params.require(:dish).permit(:dishpicture, :title, :review)
	end
end
