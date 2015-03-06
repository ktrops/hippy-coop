class Purchase < ActiveRecord::Base
	has_one :member
	has_one :room

end