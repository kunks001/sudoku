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
		cell_neighbours = [n_row(cell).to_a, (n_column(cell)).to_a, (n_box(cell)).to_a]
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
		slices.each { |box| @boxes << box.transpose }
		return_boxes
	end

	def return_boxes
		boxes = @boxes.flatten!
		@boxes = boxes.each_slice(9).to_a
	end

	def solve
		while !solved? 
			cells.each { |cell|	cell.find_value(self) }
		end
		values
	end
end
