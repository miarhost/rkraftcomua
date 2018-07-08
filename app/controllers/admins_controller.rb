class AdminsController < ApplicationController

	before_action :authenticate_admin! 

	def index
	 @total_orders = Order.count
	 @inquiries = Inquiry.all 
	 @images = Image.all
	end
end
