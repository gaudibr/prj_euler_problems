require 'Prime'

def nth_prime(n)
  p = Prime.instance
  arr = p.first n
  return arr.last
end

puts nth_prime(10001)