class PostcardsController < ApplicationController

	def index
		@postcards = Shoppe::Product.root.ordered.includes(:product_categories, :variants)
		@postcards = @postcards.group_by(&:product_category)
	end

	def show
		@postcard = Shoppe::Product.root.find_by_permalink(params[:permalink])

		congress_people = "https://openstates.org/api/v1/legistators/geo/?lat=35.79&long=-78.78"
		uri = URI.parse(congress_people)
		byebug;
	end

	def new
	   @postcard = Postcard.new
	   if request.xhr?
	     render partial: 'postcards/new', locals: {postcard: @postcard}
	   end
  	end

	def create
		@postcard = Postcard.new(postcard_params)
		if @postcard.save
		  render 'basket'
		  # redirect_to "/films/#{@postcard.review.film.id}"
		else
		  render 'new'
		end
	end

	def buy
	  @postcard = Shoppe::Product.root.find_by_permalink!(params[:permalink])
	  current_order.order_items.add_item(@postcard, 1)
	  redirect_to postcard_path(@postcard.permalink), :notice => "Product has been added successfuly!"
	end
end
