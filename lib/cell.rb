class Cell

attr_accessor :value

	def initialize(arg)
		@value = arg
		@neighbours = nil
		@possible_cell_values = []
		@neighbour_values
	end

	def value
		@value
	end

	def neighbours
		@neighbours
	end

	def neighbour_values
		@neighbour_values
	end

	def possible_cell_values
		@possible_cell_values
	end

	def candidates
		(1..9).to_a
	end

	def find_value(grid)
		if value == 0
			neighbours = grid.cell_neighbours(self)

			set_neighbour_values(neighbours)
			set_possible_cell_values(neighbour_values)

			set_value if possible_cell_values.count == 1
		end
	end

	def set_neighbour_values(neighbours)
		n_values = []
		
		neighbours.each { |n| n_values << n.value }

		n_values = n_values.uniq!.sort
		n_values.shift

		@neighbour_values = n_values
	end

	def set_possible_cell_values(neighbour_values)
		for n in (1..9) 
			if neighbour_values.include?(n)
			else
				@possible_cell_values << n
			end
		end
	end

	def set_value
		@value = possible_cell_values.shift
	end

	# def recursive(n=9)
	# 	return n if n == 0
	# 	if neighbour_values.include?(n)
	# 	else
	# 		@possible_cell_values << n
	# 	end
	# 	recursive(n-1)
	# end

end