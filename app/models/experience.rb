class Experience < ActiveRecord::Base
  include PgSearch
  multisearchable :against => :unique_place_id
  belongs_to :user
  has_many :dishes
end
