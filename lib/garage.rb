require_relative 'bike_container'

class Garage

	include BikeContainer

	def accept(bike)
		bike.fix!
		dock(bike)
	end

	def unfixed_bikes
		bikes.select {|bike| bike.broken? }
	end

end