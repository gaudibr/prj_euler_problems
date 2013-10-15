require 'benchmark'

class Integer

  def Integer.triangular n
    (n*(n+1))/2
  end

  def Integer.pentagonal n
    n*(3*n-1)/2
  end

  def Integer.hexagonal n
    n*(2*n-1)
  end

  def triangular_index
    (Math.sqrt(8*self+1)+1)/2
  end

  def pentagonal_index
    Math.sqrt(24*self+1)+1
  end

  def hexagonal_index
    (Math.sqrt(8*self+1)+1)/4
  end

  def triangular?
    self.triangular_index % 1 == 0
  end

  def pentagonal?
    self.pentagonal_index % 6 == 0
  end

  def hexagonal?
    self.hexagonal_index % 1 == 0
  end


end



def pb45
  (144..100000).each { |i|
    n = Integer.hexagonal i
    break if puts n, n.hexagonal_index, n.pentagonal_index, n.triangular_index if n.triangular? if n.pentagonal?
  }
end


puts Benchmark.measure {pb45}