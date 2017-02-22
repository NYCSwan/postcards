class PostcardsController < ApplicationController

	def index
		@postcards = Shoppe::Product.root.ordered.includes(:product_categories, :variants)
		@postcards = @postcards.group_by(&:product_category)
	end

	def show
		@postcard = Shoppe::Product.root.find_by_permalink(params[:permalink])
	end
end
