class MembersController < ApplicationController
	def home
		@members = Member.all
	end

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
		# @room = @member.create_room
		@member.room.update(rent: params[:member][:room_attributes][:rent], room_name: params[:member][:room_attributes][:room_name])
		session[:member_id] = @member.id
		session[:room_id] = @member.room.id
		if @member.save
			redirect_to new_purchase_url
		else
			render :new
		end
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		@member.room.update(room_params)
		redirect_to purchase_path(@member.id)
	end

	def show
		@member = Member.find(params[:id])
	end

	def room_params
		params.require(:room).permit(:rent, :room_name)
	end

	def member_params
		params.require(:member).permit(:name, :room_id,
										room_attributes: [:rent, :room_name, :member_id],
										purchase_attributes: [:description, :cost, :member_id])
	end
end