require 'Prime'

a = []
for i in 10..99
  for j in 10..99

    a << [i,j]  if i != j
  end
end

results = []

a.each do |b|
  s1 = b[0].to_s.split('')
  s2 = b[1].to_s.split('')

  for k in 1..2
    for l in 1..2
      n = s1[k-1].to_f
      d = s2[l-1].to_f
      n1 = s1[k%2].to_f
      d1 = s2[l%2].to_f

      q0 = b[0].to_f/b[1].to_f
      q = n/d if d!=0



      if (q0 == q) && (n1==d1) && (q < 1) && (n1 != 0)
        results << [b,[n,d],[n1,d1]]
      end if d !=0
    end
  end
end

puts results.map {|e| e[1][0].to_i}.inject(:lcm)
puts results.map {|e| e[1][1].to_i}.inject(:lcm)

puts results.to_s

#the actual result is the denominator of the fraction resulting from the multiplication of the four fractions in their lowest possible terms (simplified)