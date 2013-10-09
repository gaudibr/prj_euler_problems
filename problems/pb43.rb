require 'prime'
require'benchmark'

def pb43
  zero_to_nine_pandigital = ["0","1","2","3","4","5","6","7","8","9"]

  primes = []
  Prime.each(17) {|prime| primes << prime}

  proper_pdn = []
  zero_to_nine_pandigital.permutation(10).each do |e|
    count = 1
    property = true
    e.each_cons(3) {|a|
      if count>1
        sub_number = a.join.to_i
        if (sub_number % primes[count-2]) != 0
          property = false
        end
      end
      count+=1
    }
    proper_pdn<< e.join.to_i if property == true
  end

  puts proper_pdn.reduce(:+)
end

puts Benchmark.measure{pb43}