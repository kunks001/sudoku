cells = (1..81).to_a
boxes = []


slices = (cells.each_slice(9).to_a).each_slice(3).to_a

slices.each { |box| boxes << box.transpose }
	
boxes = boxes.flatten.each_slice(9).to_a

boxes = boxes.each { |box| box.sort! }
	
print boxes