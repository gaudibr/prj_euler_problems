require 'Prime'

def triangle_number(n)
  sum = 0
  for i in 1..n
    sum+=i
  end
  return sum
end


def count_divisors(n)
  p = Prime.prime_division(n)
  factors = [1]
  while !p.empty?
    a = p.pop
    for i in 1..a[1]
      factors.push(a[0])
    end
  end
  a = []
  b = []
  for i in 2..factors.length
    a.concat(factors.combination(i).to_a)
  end
  a.each do |n|
    prod = 1
    n.each do |i|
      prod*=i
    end
    b.push(prod)
  end
  return b.uniq
end


puts count_divisors(triangle_number(100000000)).length