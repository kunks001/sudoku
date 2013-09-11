class Grid

attr_accessor :cells

	def initialize
		setup
	end

	def setup
		num = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'.split('')
		@cells = num.map {|value| Cell.new(value.to_i) }
	end

	def return_rows
		@cells = cells.each_slice(9).to_a
	end

	def cells
		@cells
	end
	
	def solve
	end
end
