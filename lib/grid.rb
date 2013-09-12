class Grid

attr_accessor :cells

	def initialize
		@cells = nil
		@rows = nil
		@boxes = []
		setup
		row_setup
		boxes_setup
	end

	def setup
		num = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'.split('')
		@cells = num.map {|value| Cell.new(value.to_i) }
		# .each_slice(9).to_a
	end

	def rows
		@rows
	end

	def boxes
		@boxes
	end

	def row_setup
		@rows = cells.each_slice(9).to_a
	end

	def cells
		@cells
	end

	def values
		x = Array.new
		cells.each { |cell| x << cell.value }
		x
	end

	def solved?
		values.include?(0) ? false: true
	end

	def cell_neighbours(cell)
		cell_neighbours = n_row(cell).concat(n_column(cell)).concat(n_box(cell))
		cell_neighbours
	end

	def n_row(cell)
		cell_row = rows.select { |array| array.include?(cell)}.flatten
		cell_row
	end

	def n_column(cell)
		cell_column = rows.transpose.select { |array| array.include?(cell)}.flatten
		cell_column
	end

	def n_box(cell)
		cell_box = boxes.select { |box| box.include?(cell) }.flatten
		cell_box
	end

	def boxes_setup
		slices = (cells.each_slice(9).to_a).each_slice(3).to_a
		build_boxes(slices)
	end

	def build_boxes(slices)
		slices.each { |box| @boxes << box.transpose }
		split_boxes
	end

	def split_boxes
		boxes = @boxes.flatten.each_slice(9).to_a
		boxes
	end

	def solve
		# outstanding_before, looping = SIZE, false
		# while !solved? 
			# && !looping

			cells.each { |cell|	cell.find_value(self) }

			# outstanding 		= @cells.count { |c| c.solved? }
			# looping 			= outstanding_before == outstanding
			# outstanding_before 	= outstanding
		# end
	end
end
