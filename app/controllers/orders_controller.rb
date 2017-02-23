class OrdersController < ApplicationController

	def destroy
	  current_order.destroy
	  session[:order_id] = nil
	  redirect_to root_path, :notice => "Basket emptied successfully."
	end

	def update
		@order = current_order.order_items
	end
	
	def checkout
	  @order = Shoppe::Order.find(current_order.id)
	  if request.patch?
	    if @order.proceed_to_confirm(params[:order].permit(:first_name, :last_name, :billing_address1, :billing_address2, :billing_address3, :billing_address4, :billing_country_id, :billing_postcode, :email_address, :phone_number))
	      redirect_to checkout_payment_path
	    end
	   else 
	   	redirect_to checkout_path, :notice => "You forgot something."
	  end
	end

	def payment
	  if request.post?
	    redirect_to checkout_confirmation_path
	  end
	end

	def confirmation
		if request.post?
			current_order.confirm!
			session[:order_id] = nil
			redirect_to root_path, :notice => "Order has been placed! Not technically tho.. this is where the cc gateway comes into play"
		end
	end
end
