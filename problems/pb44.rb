require 'benchmark'

class Integer
  def Integer.pentagonal n
    n*(3*n-1)/2
  end

  def pentagonal?
    (Math.sqrt(24*self+1)+1) % 6 == 0
  end
end

ENDS = [0,1,2,5,6,7]
MEMO = []




def pb44
  ENDS.each do |i|
    ENDS.each do |j|
      MEMO<< [i,j] if ENDS.include?(((j-i)+10)% 10) && ENDS.include?((i+j)%10)
    end
  end

  i = 2
  while i < 10000000000
    a = Integer.pentagonal i
    li = a.to_s.split('').last


    (i-1).downto(1) do |j|
      b = Integer.pentagonal(j)
      lj = b.to_s.split('').last

      next if (lj == "7" || lj == "2")
      next if !MEMO.include?([lj.to_i,li.to_i])

      if (a - b).pentagonal?
        return 1 if puts [a, i, b, j].to_s if (b+a).pentagonal?
      end
    end

    i+= 1

  end
end

puts Benchmark.measure{pb44}