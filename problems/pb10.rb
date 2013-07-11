require 'Prime'

sum = 0
p = Prime.instance
for n in p.each
  break if n>=2000000
  sum+=n
end

puts sum