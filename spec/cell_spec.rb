require './lib/grid'
require './lib/cell'

describe Cell do

let(:grid){Grid.new}
let(:cell){Cell.new(0)}


	it 'should initialize with a value' do
		cell.value.should eq 0
	end

	it 'should know the possible number values' do
		cell.candidates.should include 1, 2, 3
	end
end