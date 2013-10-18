require 'benchmark'
require 'prime'

(1..(7**2)).to_a.select{|x| x.prime?}.length
def pbx
end

puts Benchmark.measure { pbx }