class Restaurant < ActiveRecord::Base
	RATINGS = [1,2,3,4,5]
	belongs_to :city

	validates_presence_of :name, :food_type
	validates :cost_rating, inclusion: {in: RATINGS}
	validates :open, :alcohol, :take_out, inclusion: {in: [true, false]}

	# class method on active record modle is called a scope
	# Restaurant.all.by_name
	def self.by_name
		order(:name)
	end

	def self.ratings
		RATINGS
	end

	# Restaurant.all.by_cost
	def self.by_cost
		order(:cost_rating)
	end

	# Instance method
	# Restaurant.first.status
	def status
		if self.open
			"The Restaurant #{self.name} is open for business!"
		else
			"The restaurant #{self.name} opens very soon business!"
		end
	end
end
