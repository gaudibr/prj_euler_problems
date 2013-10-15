require 'benchmark'

# @param [Integer] n : upper limit of the search for double based palindromes
# @return [Array]  : array with all double based palindromes found
def double_base_palindromes (n)
  dbp = []
  (1..n).each { |i|
    if i.odd?
      begin
        s = i.to_s
        sb = i.to_s(2)


        dbp << i if s==s.reverse && sb==sb.reverse

      end
    end
  }
  dbp
end

puts Benchmark.measure {puts double_base_palindromes(1000000).reduce(:+)}
