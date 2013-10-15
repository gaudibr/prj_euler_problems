require 'benchmark'
require 'prime'

PRIMES = []
def prime_generation n
  Prime.each(n) {|prime|
    PRIMES << prime
  }
end

def pbx
  limit = 100000
  prime_generation limit
  i = 1
  sum = 0
  primes = []
  while true
    if sum + PRIMES[i] < 1000000
      sum += PRIMES[i]
      primes << PRIMES[i]
    else
      break
    end
    i+=1
  end

  rest = []
  sum_rest = 0
  while !sum.prime?
    n = primes.shift
    sum -= n
    sum_rest+=n
    if sum + PRIMES[i+1]<1000000
      i+=1
      sum += PRIMES[i]
      primes << PRIMES[i]
    end
  end


  puts sum, primes.length
end

puts Benchmark.measure { pbx }