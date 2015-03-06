class RoomsController < ApplicationController
	def new
		@room = Room.new
		@room.member = Member.new
	end

	def index
	end

	def create
		@room = Room.create(room_params)
		if @room.save
			redirect_to new_purchase_url, notice: 'Room was successfully registered.'
		else
			render :new, notice: 'Didnt save. Try again.'
		end
	end

	def show
	end

	def room_params
		# raise params.inspect
		params.require(:room).permit(:room_name, :rent, 
									member_attributes: [:name])
	end
end