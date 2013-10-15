require 'benchmark'

class Integer
  @@memo = {0=>1}

  attr_reader :memo

  def factorial
    if @@memo[self] == nil
      if (self < 2)
        @@memo[self] = self
        return self
      else
        @@memo[self] = self * (self - 1).factorial
        return @@memo[self]
      end
    else
      return @@memo[self]
    end
  end

  def combination_size r
    (self.factorial)/((r.factorial)*(self-r).factorial)
  end
end

def pbx
  ways = 0
  n = 23
  while n <=100
    (1..n).each {|i|
      ways += 1 if n.combination_size(i) > 1000000
    }

    n += 1
  end
  puts ways, 23.combination_size(10)
end

puts Benchmark.measure { pbx }