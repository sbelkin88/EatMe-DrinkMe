class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  include PgSearch
  multisearchable :against => :username
  
	has_many :experiences
	
	has_many :active_relationships,  class_name:  "Relationship",
	                                   foreign_key: "follower_id",
	                                   dependent:   :destroy
	has_many :passive_relationships, class_name:  "Relationship",
	                                   foreign_key: "followed_id",
	                                   dependent:   :destroy

	has_many :following, through: :active_relationships,  source: :followed
	has_many :followers, through: :passive_relationships, source: :follower



	def follow(other_user)
	  active_relationships.create(followed_id: other_user.id)
	end

	def unfollow(other_user)
	  active_relationships.find_by(followed_id: other_user.id).destroy
	end

	def following?(other_user)
	  following.include?(other_user)
	end
	
end



