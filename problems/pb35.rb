require 'Prime'
require 'benchmark'

class Integer
  def circular_prime?
    Prime.circular_prime?(self)
  end
end

class Prime
  @@circular = []
  @@non_circular = []

  attr_reader :circular, :non_circular

  def circular_prime?(value)
    return true if @@circular.include?(value)
    return false if @@non_circular.include?(value)
    b = true
    s = value.to_s
    a = s.split('')

    if /[024568]/ =~ s && value != 2 && value != 5
      b=false
      @@non_circular << value
      return b
    end

    t = []

    a.length.times do
      e = a.shift
      a << e
      t << a.clone
    end

    p = t.map {|e| e.join.to_i}

    p.each do |e|
      e.prime? ? next : b=false
    end

    p.each do |e|
      if e.prime?
        if b
          @@circular << e if !@@circular.include?(e)
        else
          @@non_circular << e if !@@non_circular.include?(e)
        end
      end
    end
    return b
  end
end

def pb35
  circular_primes = []
  primes = []

  for i in 1..999999
    circular_primes << i if i.circular_prime? if i.prime?
  end

  puts primes.to_s , primes.length
  puts circular_primes.to_s, circular_primes.length
end


puts Benchmark.measure {pb35}