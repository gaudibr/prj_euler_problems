def divby(n,d)
	return (n % d)==(0)?true:false
end

i = 1
arr = []

while (i<1000) do 
	if (divby(i,3))
		arr.push(i)
	elsif (divby(i,5))
		arr.push(i)
	end
	i+=1
end

sum = 0
for i in arr
	sum += i
end
puts sum