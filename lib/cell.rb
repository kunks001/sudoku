class Cell

attr_accessor :value

	def initialize(arg)
		@value = arg
	end

	def value
		@value
	end

	def candidates
		(1..9).to_a
	end

	# def filled_out?
	# 	self != nil ? true : false 
	# end
end