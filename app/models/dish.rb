class Dish < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :review]
  pg_search_scope :venue_search, :associated_against => {:venue => [:name, :city]}
  belongs_to :experience
  belongs_to :venue

  has_attached_file :dishpicture,
  									:default_url => "/images/No_image_available",
  									styles: { :medium => "200x200>", :thumb => "100x100>" }
  validates_attachment_content_type :dishpicture, :content_type => /^image\/(png|gif|jpeg|jpg)/

  validates :title, presence: true
end
