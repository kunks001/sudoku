class Grid

attr_accessor :cells

	def initialize
		@cells = Array.new(81, Cell.new)
		setup
	end

	def cells
		@cells
	end
	
	def solve
	end
end
