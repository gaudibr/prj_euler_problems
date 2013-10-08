require 'benchmark'

class Integer
  def reverse(base=10)
    r = self.to_s.reverse.to_i
  end
end

def double_base_palindromes n
  dbp = []
  (1..n).each { |i|
    if i.odd?
      begin
        s = i.to_s
        sb = i.to_s(2)
        ib = s.to_i

        dbp << i if s==s.reverse && sb==sb.reverse

      end
    end
  }
  return dbp
end

puts Benchmark.measure {puts double_base_palindromes(1000000).reduce(:+)}
