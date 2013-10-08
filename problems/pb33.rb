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

      r1 = s1[k%2]
      r2 = s2[l%2]
      puts "1:",b.to_s
      puts "2:", n.to_s,d.to_s,r1,r2
      if n/d == b[0].to_f/b[1].to_f && r1==r2
        results << [b,[n,d]]  if (b[0].to_i % n.to_i ) != 0
      end if d !=0
    end
  end
end

puts results.to_s