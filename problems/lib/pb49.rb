require 'benchmark'
require 'prime'

def pbx
  buffer = []
  (1000..9999).each do |n|
    if !buffer.include?(n)
      a = n.to_s.split('')
      p = a.permutation(4).to_a.uniq.map {|e| e.join.to_i}
      p.each do |i|
        buffer<<i
      end
      p = p.select {|e| e.prime? && e>1000}.sort
      p.combination(3).each {|c|
        puts c.map{|e| e.to_s}.join, c[1]-c[0]  if c[1]-c[0] == c[2]-c[1]
      }

    end

  end
end

puts Benchmark.measure { pbx }