
require 'rails_helper'
require_relative '../app/models/member.rb'

RSpec.describe Member, :type => :model do
	it "should have one room" do 
		m = Member.reflect_on_association(:room)
		m.macro.should == :belongs_to
	end

end