require 'benchmark'
require 'prime'


class Integer
  def double_square?
    Math.sqrt(self.to_f/2) % 1 == 0
  end
end

def pb46
  (100..10000).each { |n|
    if n.odd? && !n.prime?
      goldbach = false
      r = Math.sqrt(n/2)
      r.floor.to_i.downto(1) {|i|
        f = n-2*i**2
        f.downto(2) {|prime|
          if f.prime?
            goldbach = true if n==prime+2*i**2
            #puts "#{n}=#{prime}+2* #{i} **2" if goldbach
            break if goldbach
          end
        }
        break if goldbach
      }
      puts n if !goldbach
      break if !goldbach
    end
  }
end

PRIMES = []
def prime_generation
  Prime.each(10000) {|prime|
    PRIMES << prime
  }
end

def pb46b

end

puts Benchmark.measure{prime_generation}

puts 8.double_square?, 9.double_square?, 16.double_square?
puts Benchmark.measure{pb46}