require 'Prime'

truncatable_primes = []
non_truncatable_primes = []

(10..1000000).each { |prime|
  if prime.prime?
    a = prime.to_s.split('')
    t_left = true
    while a.length > 0
      j = a.join.to_i
      if !j.prime?
        t_left = false
        break
      end
      a.pop
    end
    next if !t_left
    a = prime.to_s.split('')
    t_right = true
    while a.length > 0
      if !a.join.to_i.prime?
        t_right = false
        break
      end
      a.shift
    end
    next if !t_right
    truncatable_primes << prime
    break if truncatable_primes.length >=11
  end
}

puts truncatable_primes.to_s, truncatable_primes.reduce(:+)