require 'benchmark'

class Fixnum
  def same_digits?(n)
    self.to_s.split('').sort == n.to_s.split('').sort
  end
end

def pbx
  (1..5).each { |i|
    ((10**i)..(10**(i+1))).each do |j|
      break if j*6 >= 10**(i+1)
      if (j*5).same_digits?(j)
        if (j*4).same_digits?(j)
          if (j*3).same_digits?(j)
            if (j*2).same_digits?(j)
              if (j*6).same_digits?(j)
                puts j
                break
                end
            end
          end
        end
      end
    end
  }
end

puts Benchmark.measure { pbx }