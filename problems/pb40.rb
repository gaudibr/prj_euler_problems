s = "0."
i = 1
while s.length <=1000002 do
  s.concat(i.to_s)
  i+=1
end
prod = 1
for i in 0..6
  dn = s[10**i+1]
  prod *= dn.to_i
end

puts prod