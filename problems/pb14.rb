def collatz(n)
  return n.even? ? (n / 2) : ( 3 * n + 1)
end

def collatz_sequence(n)
  seq = []
  begin
    seq.push(n)
    n = collatz(n)
  end while n != 1
  return seq.length
end


def highest_collatz_seq(n)
  highest = 0
  number = n
  while n < 10000
    curr = collatz_sequence(n)
    if curr > highest
      highest = curr
      number = n
    end
    n+=1
  end
  puts highest
  return number
end
       
puts highest_collatz_seq(100)
    
