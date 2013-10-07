class Array

  def pandigital?
    b = self.join

    if b.split('').uniq.length == 9
      return true
    end if b.length == 9
    return false
  end
end


products = []

for i in 10..99
  for j in 100..999
    a = []
    p = i*j
    a = [i.to_s,j.to_s,p.to_s]
    if a.pandigital?
      products << a
    end
  end
end

for i in 1..9
  for j in 1000..9999
    a = []
    p = i*j
    a = [i.to_s,j.to_s,p.to_s]
    if a.pandigital?
      products << a
    end
  end
end

results = []
products.map { |product| results << product[2].to_i}
puts results.uniq.reduce(:+)