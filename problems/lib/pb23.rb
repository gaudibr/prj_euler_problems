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
end

abundant = []
for i in 1..28123
	abundant.push(i) if i.abundant?
end
abundant_sums = abundant.repeated_combination(2).to_a.map {|e| e.reduce(:+)}.uniq.select {|num| num < 28123}
puts ((1...28123).to_a - abundant_sums).reduce(:+)
