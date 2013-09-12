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

			#### RETURNS ARRAY OF CELL NEIGHBOURS

			n_values = []

			neighbours.each { |n| n_values << n.value }

			n_values = n_values.uniq!.sort

			##### CREATES, POPULATES THEN SORTS ARRAY WITH NEIGHBOUR VALUES

			n_values.shift

			@neighbour_values = n_values

			##### GETS RID OF 0 VALUE IN ARRAY AND ASSIGNS TO INSTANCE VARIABLE

			for n in (1..9) 
				if neighbour_values.include?(n)
				else
					@possible_cell_values << n
				end
			end

			##### FINDS POSSIBLE CELL VALUES IN ARRAY FORM

			if possible_cell_values.count == 1
				@value = possible_cell_values
			end
		else
		end
		# possible_cell_values = []
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