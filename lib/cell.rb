class Cell

attr_accessor :value

	def initialize(value)
		@value = value
		@neighbours = nil
	end

	def value
		@value
	end

	def neighbours
		@neighbours
	end

	def find_value(grid)
		if value == 0
			neighbour_values = find_neighbours(grid) 
			possible_values = find_possible_values(neighbour_values)
			set_value?(possible_values)
		end
	end

	def find_neighbours(grid)
		if value == 0
			neighbours = grid.cell_neighbours(self)
			retrieve_neighbour_values(neighbours)
		end
	end

	def retrieve_neighbour_values(neighbours)
		neighbours.flatten.map! do |cell|
			cell = cell.value
		end
	end

	def find_possible_values(neighbour_values)
		possible_cell_values = []
		for n in (1..9)
			unless neighbour_values.include?(n)
				possible_cell_values << n
			end
		end
		possible_cell_values
	end

	def set_value?(possible_cell_values)
		if possible_cell_values.count == 1
			set_value(possible_cell_values)
		end
	end

	def set_value(possible_cell_values)
		@value = possible_cell_values.shift
	end
end