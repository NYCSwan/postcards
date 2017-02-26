class Postcard < ActiveRecord::Base
belongs_to :category

	def find_congress_people
		self.Sunlight::Legislator.all_for(:address => "123 Fifth Ave New York, NY 10003")
	end
end
