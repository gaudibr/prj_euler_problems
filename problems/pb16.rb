i = 2 **1000
s = i.to_s
sum = 0
for d in 0...s.length
  sum += s[d].to_i
end
puts sum