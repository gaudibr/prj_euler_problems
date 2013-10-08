class Integer
  def factorial
    if (self < 2)
      self
    else
      self * (self - 1).factorial
    end
  end
end

MEMO = {0=>1}

for i in 1..9
  MEMO[i]=i.factorial
end

def sum_factorials limit
  results = []
  for n in 3..limit
    a = n.to_s.split('')
    results << n  if n == a.map {|e| MEMO[e.to_i]}.reduce(:+)
  end
  return results
end

puts sum_factorials(3000000).reduce(:+)
