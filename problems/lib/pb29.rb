def distinct_powers n
	numbers = (2..n).to_a.repeated_permutation(2).to_a
	powers = numbers.map {|e| e[0]**e[1]}
	return powers
end

puts distinct_powers(100).uniq.length