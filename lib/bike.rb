class Bike

	attr_accessor :serial

	def initialize
		fix!()
	end

	def broken?
		@broken
	end

	def break!
		@broken = true
	end

	def fix!
		@broken = false
	end

end