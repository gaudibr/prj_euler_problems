require 'benchmark'
require 'prime'

def pb47
  buffer = []

  i = 1
  begin
    p = i.prime_division
    if p.length != 4
      buffer.clear
      i += 1
      next
    end
    p.each do |f|
      if !buffer.include?(f)
        buffer << f
      else
        buffer.clear
        break
      end
    end
    i +=1
  end until buffer.length == 16
  print i - 4
end

puts Benchmark.measure {pb47}