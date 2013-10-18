require 'benchmark'

class Integer
  def digit_sum
    self.to_s.each_char.map{|e| e.to_i}.reduce(:+)
  end
end

def pbx
  puts 100.downto(1).to_a.product(100.downto(1).to_a).map{|e| (e[0]**e[1]).digit_sum}.max
end

puts Benchmark.measure { pbx }