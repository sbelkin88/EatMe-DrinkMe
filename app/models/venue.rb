require 'pry'

class Venue < ActiveRecord::Base
  has_many :dishes
  validates :name, :address, :city, :state, :zip, :phone, presence: true

  # I think I would continue to refactor this code.  Probably I would make a method
  # that created the options for the Venue object and then just call that method
  # in the "new()".  It could also in turn call another method which retrieves the
  # place_results from the remote API.  I would definitely take a shot at refactoring
  # this until your create_venue() method looks like:
  #
  # def self.create_venue place
  #   @venue ||= Venue.create_with(venue_params).find_or_create(place_id: place)
  # end
  #
  # def venue_params
  # ...
  # end
  #
  # def fetch_from_api
  # ...
  # end
  #
  def self.create_venue(place)
    venue = Venue.find_by(place_id: place)
    return venue if venue
    key = ENV["GOOGLE_KEY"]
    uri = URI.parse("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place}&key=#{key}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    place_results = JSON.parse(response.body)
    street_num = place_results["result"]["address_components"][0]["long_name"]
    street_address = place_results["result"]["address_components"][1]["long_name"]
    city = place_results["result"]["address_components"][2]["long_name"]
    state = place_results["result"]["address_components"][3]["short_name"]
    zip = place_results["result"]["address_components"][5]["long_name"]
    phone = place_results["result"]["formatted_phone_number"]
    website = place_results["result"]["website"]
    Venue.new(name: place_results["result"]["name"], address: "#{street_num} #{street_address}", city: city , state: state, zip: zip, phone: phone, website: website, place_id: place)
  end
end
