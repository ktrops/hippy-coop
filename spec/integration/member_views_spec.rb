require 'spec_helper'
require 'capybara/rspec'

describe "the member interface" do
	before(:all) do
		@members = []
		3.times{ @members << Fabricate(:member)}
	end
	it "should list the members on the home page" do
		visit root_path
		@members.each do |member|
			page.should have_content(member.name)
		end
	end
end