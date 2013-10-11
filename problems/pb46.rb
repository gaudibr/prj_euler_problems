require 'benchmark'
require 'prime'


class Integer
  def double_square?
    Math.sqrt(self.to_f/2) % 1 == 0
  end
end

PRIMES = []
def prime_generation n
  Prime.each(n) {|prime|
    PRIMES << prime
  }
end


def pb46
  limit = 10000
  prime_generation limit
  (100..limit).each { |n|
    exception = true
    if n.odd? && !n.prime?
      PRIMES.each { |prime|
        break if prime > n
        if (n-prime).double_square?
          exception = false
          break
        end
      }
      if exception==true
        puts n
        break
      end
    end
  }
end

puts PRIMES
puts Benchmark.measure{pb46}