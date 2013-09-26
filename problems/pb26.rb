require 'Prime'

class Integer
  def divisors
    divs = [1]
    2.upto(Math.sqrt(self)) {|i| divs.concat [i, self / i] if self % i == 0}
    divs.uniq
  end
  def divisors!
    self.divisors.push(self)
  end
  def divisors_sum
    self.divisors.inject {|sum, i| sum + i}
  end
  def abundant?
  	self.divisors_sum>self
  end
  def prime_factors
  	Prime.prime_division(self).map {|e| e.first}.push(1)
  end
  def common_factors(n)
  	self.prime_factors.select {|i| n.prime_factors.include?(i)}
  end
  def relatively_prime(n)
  	self.common_factors(n).eql?([1])
  end
  def totatives
  	(1...self).select {|e| e.relatively_prime(self)}
  end
  def totient
  	self.totatives.count
  end
  def magic_number
  	if self.relatively_prime(10)
  		n = (1..9).select {|e| (self*e)%10==9}.first
  		return (self*n+1)/10
  	else
  		return nil
  	end
  end
  def length_of_period
  	if self.relatively_prime(10)
  		i = 1
  		until (10**i) % self == 1 do
  			i += 1
  		end
  		return i
  	else
  		return nil
  	end
  end
end

a = (2..1000).to_a.select {|e| e.relatively_prime(10)}
b = a.map {|e| e.length_of_period }

puts a[b.rindex(b.max)]
