class OrdersController < ApplicationController

	def destroy
	  current_order.destroy
	  session[:order_id] = nil
	  redirect_to root_path, :notice => "Basket emptied successfully."
	end

	def update
		@order = current_order.order_items
	end
	
end
