require 'benchmark'
require 'rational'

class Numeric
  @@count = 0
  attr_reader :count
  def digit_count
    self.to_s.length
  end

  def rational_expansion iter=1
    iter == self ? a = Rational(1,2) : a = Rational(1,2+rational_expansion(iter+1))
    b =  Rational(1,1) + a
    @@count+=1 if b.numerator.digit_count > b.denominator.digit_count
    puts @@count
    a
  end
end



def pbx
  1000.rational_expansion

end

puts Benchmark.measure { pbx }