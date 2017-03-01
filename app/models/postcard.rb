class Postcard < ActiveRecord::Base
belongs_to :category

	def find_congress_people
		# using lat/long get the legislators information... name/district
	end
end
