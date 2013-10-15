require 'benchmark'
require 'prime'

PRIMES = []
def prime_generation n
  Prime.each(n) {|prime|
    PRIMES << prime
  }
end


def pbx
  limit = 1000000
  prime_generation limit
  length = 0
  positions = []
  (PRIMES.index(56003)..(PRIMES.length-1)).each { |i|
    prime = PRIMES[i]
    a = prime.to_s.split('')
    if a.length > length
      length = a.length
      positions = []
      pos = (0...(a.length-1)).to_a
      (2...(a.length-1)).each { |j|
        pos.combination(j).each {|k|
          positions << k
        }
      }
      puts positions.to_s
    end

    show = true
    series = []
    positions.each { |p|
      series = []
      non_primes = 0
      show = true
      b = a.clone
      (0..9).each { |subs|
        p.each {|l|
          b[l] = subs
        }
        if b[0] == 0
          non_primes += 1
          next
        end
        new_n = b.join.to_i
        series << new_n
        non_primes += 1 if !new_n.prime?
        if non_primes > 2
          show = false
          break
        end
      }
      if show
        puts prime.to_s+" "+series.to_s+" "+p.to_s+ " "+non_primes.to_s
        break
      end

    }
    break if show
  }
end

def pbxb

  digits = []
  (0..2).each { |repeated_digit|
    digits = []
    3.times do
      repeated_digit << digits
    end

  }
end

puts Benchmark.measure { pbx }