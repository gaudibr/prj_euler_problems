require 'benchmark'
require 'Prime'


def spiral_primes
  diag_a = [1]
  primes = []
  n=3
  ratio = 1

  begin
    (0..3).each { |j|
      a = (n**2 - j*(n-1))
      primes << a if a.prime?
      diag_a << a
    }
    ratio =  primes.length.to_f/diag_a.length
    puts "side: #{n}, ratio: #{ratio}"
    n+=2
  end while ratio >=0.1

end


def pbx
  spiral_primes
end

puts Benchmark.measure { pbx }