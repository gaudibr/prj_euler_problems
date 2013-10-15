require 'benchmark'

class Fixnum
  def same_digits? n
    self.to_s.split('').sort == n.to_s.split.sort
  end
end

def pbx

end

puts Benchmark.measure { pbx }