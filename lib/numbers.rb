numbers = (1..81).to_a

slices = (numbers.each_slice(9).to_a).each_slice(3).to_a

slice = []

slices.each { |box| slice << box.transpose }

# slice = slices[0].transpose + slices[1].transpose + slices[2].transpose

# slice = slices.each do |box|
# 	box.each do |row|
# 		row.transpose
# 	end
# end
	

slice = slice.flatten

boxes = slice.each_slice(9).to_a

print boxes