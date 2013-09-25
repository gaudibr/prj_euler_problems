require 'Prime'

class NumberProps
	def initialize(n)
		@value = n
		@divisors = init_divisors_bis2(n)
    @d_of_n = init_d_of_n(@divisors)
	end

	def init_divisors(number)
    (1...number).select { |value| number % value == 0 }
  end

  def init_divisors_bis(n)
    number = n
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
    for i in 1..factors.length
      a.concat(factors.combination(i).to_a)
    end
    a.each do |n|
      prod = 1
      n.each do |i|
        prod*=i
      end
      if prod != number
        b.push(prod)
      end
    end
    return b.uniq
  end

  def init_divisors_bis2(n)
    
    
    divs = [1]
    2.upto(Math.sqrt(n)) {|i| divs.concat [i, n / i] if n % i == 0}
    return divs

  end

  

  def init_d_of_n(n)
    n.inject {|sum, i| sum + i}
  end

  def d_of_n
    @d_of_n
  end

  def value 
    @value
  end

end

def sum_amicable_numbers(n)
  amicable = []
  for i in 2...n
    number = NumberProps.new(i)
    b = number.d_of_n
    v = number.value
    if b > v
      other_number = NumberProps.new(b)
      if other_number.d_of_n == v
        amicable.push(number.value)
        amicable.push(other_number.value)
      end
    end
  end
  puts amicable.to_s
  return amicable.inject {|sum, i| sum + i}
end
