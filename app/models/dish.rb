class Dish < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :review]
  pg_search_scope :venue_search, :associated_against => {:venue => [:name, :city]}
  default_scope {order("created_at")}
  belongs_to :experience
  belongs_to :venue

  has_attached_file :dishpicture,
  									:default_url => "/images/No_image_available",
  									styles: { :large => "700x700>", :medium => "500x500>", :thumb => "300x300>" }

  validates_attachment_content_type :dishpicture, :content_type => /^image\/(png|gif|jpeg|jpg)/

  validates :title,:review, presence: true
end
