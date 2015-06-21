class Experience < ActiveRecord::Base
  include PgSearch
  belongs_to :user
  has_many :dishes
  accepts_nested_attributes_for :dishes
end
