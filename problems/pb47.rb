require 'benchmark'
require 'prime'

class Integer
  def prime_factors
    self.prime_division.map {|e| "#{e[0]}**#{e[1]}"}
  end
end



def pb47
  buffer = []
  ints = []

  i = 655
  while buffer.length < 16
    p = i.prime_division
    if p.length != 4
      buffer,ints = [],[]
      i += 1
      next
    else
      puts "#{i}, #{p.to_s}"
    end
    p.each do |f|
      if !buffer.include?(f)
        buffer << f
      else
        buffer, ints = [],[]
        break
      end
    end
    if !buffer.empty?
      ints << i
    end
    i +=1
  end
end

puts Benchmark.measure {pb47}