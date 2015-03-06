class Member < ActiveRecord::Base
	belongs_to :room
	has_many :purchases

	accepts_nested_attributes_for :purchases, :room
end