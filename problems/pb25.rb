i = 1
n = 1
previous_n = 0
while n.to_s.length < 1000
  aux = n
  n = n + previous_n
  previous_n = aux
  i += 1
end
puts i
