class PostcardsController < ApplicationController

	def index
		@postcards = Shoppe::Product.root.ordered.includes(:product_categories, :variants)
		@postcards = @postcards.group_by(&:product_category)
	end

	def show
		@postcard = Shoppe::Product.root.find_by_permalink(params[:permalink])
	end

	def buy
	  @postcard = Shoppe::Product.root.find_by_permalink!(params[:permalink])
	  current_order.order_items.add_item(@postcard, 1)
	  redirect_to postcard_path(@postcard.permalink), :notice => "Product has been added successfuly!"
	end
end
