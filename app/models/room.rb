class Room < ActiveRecord::Base
	has_one :member, foreign_key: "member_id"
	has_many :purchases 

	
end