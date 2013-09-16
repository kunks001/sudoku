require './lib/grid'
require './lib/cell'

describe Cell do

let(:grid){Grid.new}
let(:cell){grid.cells[0]}

	
	context 'it should initialise with' do
		it 'should initialize with a value' do
			expect(cell.value).to eq 0
		end

		it 'should know the possible number values' do
			expect(cell.candidates).to include 1, 2, 3, 4, 5, 6, 7, 8, 9
		end

		it 'should have an empty array of possible values' do
			expect(cell.possible_cell_values).to eq []
		end

		it 'should have an empty array of neighbour values' do
			expect(cell.neighbour_values).to eq []
		end
	end

end