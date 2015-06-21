class Experience < ActiveRecord::Base
  include PgSearch
  belongs_to :user
  has_many :dishes
  multisearchable :against => :name
  accepts_nested_attributes_for :dishes
end
