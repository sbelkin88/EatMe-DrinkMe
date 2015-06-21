class Venue < ActiveRecord::Base
  has_many :dishes
  validates :name, :address, :city, :state, :zip, :phone, presence: true
end
