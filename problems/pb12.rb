require 'Prime'

def triangle_number(n)
  sum = 0
  for i in 1..n
    sum+=i
  end
  return sum
end


def divisors(n)
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


def guess(target)
  last_number = 0
  sum = 0
  begin
    last_number +=1
    sum +=last_number
    count = divisors(sum).length
  end while count < target
  return sum
end

puts guess(501)