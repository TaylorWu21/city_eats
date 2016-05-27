class City < ActiveRecord::Base
	has_many :restaurant, dependent: :destroy

	validates_presence_of :name

	def self.by_name
		order(:name)
	end
end
