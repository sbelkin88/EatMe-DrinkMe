class Experience < ActiveRecord::Base
  include PgSearch
  multisearchable :against => :venue
  belongs_to :user
  has_many :dishes
  belongs_to :venue
  accepts_nested_attributes_for :dishes
end
