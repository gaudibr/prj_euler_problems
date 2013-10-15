require 'Prime'
require 'benchmark'

def pb41
  memo ={}
  (4..7).each do |i|
    a = []
    (1..i).each do |j|
      a << j.to_s
    end
    memo[i] = a
  end

  7.downto(4) do |i|
    b = ["2","4","5","6","8","0"]
    a = memo[i].permutation(memo[i].length)
    n = 0
    a.reverse_each do |e|
      next if b.include?(e.last)
      n = e.join.to_i
      next if !n.prime?
      break if n>0
    end
    puts n
    break if n>0
  end
end

puts Benchmark.measure{pb41}