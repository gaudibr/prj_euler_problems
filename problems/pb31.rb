 coins = [0,1,2,5,10,20,50,100,200]

# combinations = coins.repeated_combination(200).to_a.select{ |e| e.reduce(:+)==200}

# puts combinations.to_s
# puts combinations.length
count = 0
coins.repeated_permutation(200).each do |p|
	sum = 0
	p.each do |i|
		sum += i
		if sum > 200
			break
		end
	end
	if sum == 200
		count +=1
	end
end
puts count