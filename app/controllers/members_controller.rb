class MembersController < ApplicationController
	def new
		@member = Member.new
		@member.purchases.build
		
		@room = @member.build_room
	end

	def index
		@member = Member.all
	end

	def create
		@member = Member.create(member_params)
		@room = @member.create_room
		if @member.save
			redirect_to new_purchase_url
		else
			render :new
		end
	end

	def show
		@member = Member.find(params[:id])
	end

	def member_params
		params.require(:member).permit(:name, :room_id,
										room_attributes: [:rent, :name, :id, :member_id],
										purchase_attributes: [:description, :cost, :id, :member_id])
	end
end