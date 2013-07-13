def collatz(n)
  i = 0
  n.even? ? i = (n / 2) : i = ( 3 * n + 1)
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
  while n < 1000000
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
       
puts highest_collatz(500000)
    
