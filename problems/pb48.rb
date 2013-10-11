require 'benchmark'

def pbx
  sum=0
  (1..1000).each {|n|
  sum += n**n

  }
  puts sum.to_s[(sum.to_s.length-10)..(sum.to_s.length-1)]
end

def serie_stramba(n)
  (1..n).each do |x|
    yield x**x
  end
end

def pbxb
  sum = 0
  serie_stramba(1000) {|x| sum += x}
  puts sum.to_s[-10,10]
end


puts Benchmark.measure { pbx }

puts Benchmark.measure { pbxb }