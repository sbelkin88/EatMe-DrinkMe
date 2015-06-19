class Experience < ActiveRecord::Base
  include PgSearch
  pg_search_scope :venue_search, :associated_against => {:venue => [:name, :city]}
  belongs_to :user
  has_many :dishes
  belongs_to :venue
  accepts_nested_attributes_for :dishes
end
