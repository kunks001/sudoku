require './lib/grid'
require './lib/cell'

describe Grid do

let(:grid){Grid.new}

	it 'should initialise with an array of length 81' do
		grid.cells.count.should eq 81
	end

	it 'should initialise with an array of cell objects' do
		grid.cells[0].should be_an_instance_of Cell
	end

	it 'should assign values to the cell objects' do
		grid.cells[0].value.should eq 0
	end

	it 'should return a row containing a cell' do
		cell = grid.cells[5]
		grid.n_row(cell).should eq grid.rows[0]
	end

	it 'should return a column containing a cell' do
		cell = grid.cells[5]
		grid.n_column(cell).should eq grid.rows.transpose[5]
	end

	# it 'should split into 9 arrays of three arrays' do
	# 	boxes = grid.three_by_three
	# 	boxes[0].count.should eq 9
	# 	boxes[0][0].count.should eq 3
	# end
end
