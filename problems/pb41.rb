require 'Prime'


class Array

  def one_to_nine_pandigital?
    b = self.join

    if b.split('').uniq.length == 9
      return true
    end if b.length == 9 && /0/!~b
  end

  def pandigital?
    a = []
    self.each do |e|
       a.include?(e) ? return : a<<e
    end
    (MEMO[self.length] - self).empty?
  end

  def pandigital2?

  end

  def distinct?
    self.uniq==self
  end
end

class Integer
  def pandigital?
    self.to_s.split('').map { |e| e.to_i}.pandigital?
  end
  def distinct_digits?
    self.to_s.split('').distinct?
  end
  def length
    self.to_s.length
  end
end

memo ={}
(4..9).each do |i|
  a = []
  (1..i).each do |j|
    a << j.to_s
  end
  memo[i] = a
end

9.downto(4) do |i|
  b = ["2","4","5","6","8","0"]
  a = memo[i].permutation(memo[i].length)
  n = 0
  a.reverse_each do |e|
    next if b.include?(e.last)
    next if !e.join.to_i.prime?
    n = e.join.to_i
    break if n>0
  end
  puts n
  break if n>0
end

