diagonal = [1]

for i in 1..500
	increment = 2*i
	for j in 1..4
		diagonal << diagonal.last + increment
	end
end
puts diagonal.to_s

puts diagonal.reduce(:+)