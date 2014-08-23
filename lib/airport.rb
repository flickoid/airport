require './lib/weather_conditions.rb'

class Airport

	include WeatherConditions

	def initialize
		@capacity = 100
		@planes = []
	end

	def plane_count
		@planes.count
	end

	def land(plane)
		raise "You cannot land in a storm!" if weather_conditions == "stormy"	
		raise "Airport is full" if full?
		plane.land
		@planes << plane
	end

	def take_off(plane)
		raise "You cannot take off in a storm!" if weather_conditions == "stormy"
		plane.take_off
		@planes.delete(plane)
	end

	def full?
		plane_count == @capacity
	end
end