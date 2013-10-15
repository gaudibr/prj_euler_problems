def digit_nth_power n
	digit_nth = []
	for i in 2..10**(n+1)
		a = i.to_s.split('').map{|e| e.to_i**n}
		digit_nth<<i if a.reduce(:+)==i
	end
	return digit_nth
end

n = 5
r = digit_nth_power(n)

puts r.to_s
puts r.reduce(:+)
