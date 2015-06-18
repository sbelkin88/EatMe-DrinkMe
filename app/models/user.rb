class User < ActiveRecord::Base
  include PgSearch
  multisearchable :against => :username
	has_many :experiences
end
