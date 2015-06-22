require 'pry'

class Venue < ActiveRecord::Base
  has_many :dishes
  validates :name, :address, :city, :state, :zip, :phone, presence: true

  def self.create_venue(place)
    key = ENV["GOOGLE_KEY"]
    uri = URI.parse("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place}&key=#{key}")
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
    Venue.new(name: place["result"]["name"], address: "#{street_num} #{street_address}", city: city , state: state, zip: zip, phone: phone, website: website)
  end
end
