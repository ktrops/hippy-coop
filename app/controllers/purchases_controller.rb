class PurchasesController < ApplicationController
	def new
		@purchase = Purchase.new
		@member = @purchase.member
		
	end

	def index
		@purchase = Purchase.all
	end

	def create
		@purchase = Purchase.create(params_purch)
		@purchase.member.build
		if @purchase.save
			redirect_to room_url
		else
			render :new
		end
	end

	def show
		@purchase = Purchase.find(params[:id])
	end

	def params_purch
		params.require(:purchase).permit(:description, :cost, 
										member_attributes: [:name],
										room_attributes: [:rent, :name])
	end
end