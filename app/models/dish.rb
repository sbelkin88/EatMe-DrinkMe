class Dish < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :review]
  belongs_to :experience
end
