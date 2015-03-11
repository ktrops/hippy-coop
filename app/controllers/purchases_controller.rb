class PurchasesController < ApplicationController
	def new
		@purchase = Purchase.new
		@member = Member.find(session[:member_id])
		
	end

	def index
		@purchase = Purchase.all
	end

	def create
		@purchase = Purchase.create(params_purch)
		@purchase.member_id = session[:member_id]
		@purchase.save
		@member = Member.find(session[:member_id])
		@member.purchases.build
		if @purchase.save
			redirect_to purchase_path(@purchase.id)
		else
			render :new
		end
	end

	def show
		# @purchases = Purchase.find(params[:id])
		# @purchases = Purchase.where(member_id: session[:member_id])
		@purchases = Purchase.where(member_id: params[:id])
		
		count = 0
		@purchases.each do |p|
		  count += p.cost
		end
		# @members = Member.all
		# @member = Member.find_by(room_id: session[:room_id])
		@member = Member.find(params[:id])
		@room_rent = @member.room.rent
		@total_rent = @room_rent - count
	end




	def params_purch
		params.require(:purchase).permit(:description, :cost, 
										member_attributes: [:name],
										room_attributes: [:rent, :name])
	end
end