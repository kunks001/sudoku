class Cell

attr_accessor :value

	def initialize(arg, neighbours = nil)
		@value = arg
		@neighbours = neighbours
	end

	def value
		@value
	end

	def neighbours
		@neighbours
	end

	# def check_neighbours(grid)
	# 	neighbours = cell_neighbours(self)
	# end

	def candidates
		(1..9).to_a
	end

	def solve(grid)
		cell_neighbours = grid.cell_neighbours(self)

		cell_neighbour_values = []

		cell_neighbours.each do |cell|
			cell_neighbour_values << cell.value
		end

	end

	# def filled_out?
	# 	self != nil ? true : false 
	# end
end