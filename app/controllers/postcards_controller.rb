class PostcardsController < ApplicationController

	def index
		@postcards = Shoppe::Product.root.ordered.includes(:product_categories, :variants)
		@postcards = @postcards.group_by(&:product_category)
	end
end
