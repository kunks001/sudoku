class Cell

attr_accessor :value

	def initialize(arg)
		@value = arg
		@neighbours = nil
		@possible_cell_values = []
		@neighbour_values = []
		@other_other_values = []
		@other_possible_cell_values = []
		@final_possible_cell_values = []
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

	def other_possible_cell_values
		@other_possible_cell_values
	end

	def final_possible_cell_values
		@final_possible_cell_values
	end

	def possible_cell_values
		@possible_cell_values
	end

	def candidates
		(1..9).to_a
	end

	def find_value(grid)
		possible_values(grid)
		other_values(grid)
		final_values
	end

	def possible_values(grid)
		if value == 0
			neighbours = grid.cell_neighbours(self)
			neighbour_values = nv(neighbours)

			neighbour_values.each do |array|
				for n in (1..9)
					unless array.include?(n)
						possible_cell_values << n
					end
				end
				possible_cell_values.count == 1 ? set_value : reset
			end
		end
	end

	def other_values(grid)
		if value == 0
			others = grid.cell_neighbours(self)
			other_other_values = nv(others)
			other_other_values.flatten!

			for n in (1..9)
				if other_other_values.include?(n)
				else
					other_possible_cell_values << n
				end
			end

			if other_possible_cell_values.count == 1 
				set_value 
			end
		end
	end

	def final_values
		for n in (1..9)
			if possible_cell_values.include?(n) && other_possible_cell_values.include?(n)
				final_possible_cell_values << n
			end
		end	

		set_value if final_possible_cell_values.count == 1
		reset
	end

	def nv(neighbours)
		neighbours.each do |array|
			array.map! do |cell|
				cell = cell.value
			end
		end
	end

	def reset
		@possible_cell_values = []
		@other_possible_cell_values = []
		@final_possible_cell_values = []
	end

	def set_value
		@value = possible_cell_values.shift || other_possible_cell_values.shift
	end
end