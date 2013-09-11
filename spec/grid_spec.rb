require './lib/grid'
require './lib/cell'

describe Grid do

let(:grid){Grid.new}
let(:cell){Cell.new}

	it 'should initialise with an array of length 81' do
		grid.cells.count.should eq 81
	end

	it 'should initialise with an array of cell objects' do
		grid.cells[0].should be_an_instance_of Cell
	end

	it 'should assign values to the cell objects' do
		grid.cells[0].value.should eq 0
	end
	
end
