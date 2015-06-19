class Dish < ActiveRecord::Base
  # include PgSearch
  # multisearchable :against => [:title, :review]
  belongs_to :experience

  has_attached_file :dishpicture
  								
  validates_attachment_content_type :dishpicture, :content_type => /\Aimage\/.*\Z/

end
