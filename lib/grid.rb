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
        # num = "800000000003600000070090200050007000000045700000100030001000068008500010090000400".split('')
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
		cells.map{ |cell| cell.value }
	end

	def solved?
		values.include?(0) ? false: true
	end

	def cell_neighbours(cell)
		[n_row(cell).to_a, (n_column(cell)).to_a, (n_box(cell)).to_a]
	end

	def n_row(cell)
		rows.select { |array| array.include?(cell) }.flatten
	end

	def n_column(cell)
		rows.transpose.select { |array| array.include?(cell) }.flatten
	end

	def n_box(cell)
		cell_box = boxes.select { |box| box.include?(cell) }.flatten
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
	end
end
