require 'benchmark'

class Integer
  @loop_count

  def palindrome?
    self.to_s.palindrome?
  end

  def reverse
    self.to_s.reverse.to_i
  end

  def lycharel?
    self.check_lycharel(0)
  end

  def check_lycharel count
    return true if count >= 50
    (self + self.reverse).palindrome? ? false : (self+self.reverse).check_lycharel(count+1)
  end
end

class String
  def palindrome?
    self.reverse.eql? self
  end
end



def pbx
  puts 0.upto(10000).count{|x| x.lycharel?}
end

puts Benchmark.measure { pbx }