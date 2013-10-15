require 'benchmark'

def pb31
  coins =  [1,2,5,10,20,50,100,200]

  counts = [200,100,40,20,10,4,2,1]

  h = Hash[coins.zip counts]
  possibilities = 0

  h[200].downto(0) do |i|
    h[100].downto(0) do |j|
      next if 200*i+100*j > 200
      h[50].downto(0) do |k|
        next if 200*i+100*j+50*k > 200
        h[20].downto(0) do |l|
          next if 200*i+100*j+50*k+20*l > 200
          h[10].downto(0) do |m|
            next if 200*i+100*j+50*k+20*l+10*m > 200
            h[5].downto(0) do |n|
              next if 200*i+100*j+50*k+20*l+10*m+5*n > 200
              h[2].downto(0) do |o|
                next if 200*i+100*j+50*k+20*l+10*m+5*n+2*o > 200
                h[1].downto(0) do |p|
                  sum = p+2*o+5*n+10*m+20*l+50*k+100*j+200*i
                  if sum == 200
                    possibilities+=1
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  puts possibilities
end
AMOUNT = 200000
COINS =  Hash[(1..8).to_a.zip [1,2,5,10,20,50,100,200]]
def pb31b
  puts ways(AMOUNT,8)
end

def ways target, avc
  return 1 if avc <= 1
  res = 0
  while target >= 0
    res += ways(target,avc-1)
    target -= COINS[avc]
  end
  return res
end


MEMO = Array.new(AMOUNT+1) {|index| Array.new(7,0)}

def pb31c
  puts ways2(AMOUNT,8)
end

def ways2 target,avc
  if avc <= 1
    return 1
  end
  t = target
  if MEMO[t][avc-2] > 0
    return MEMO[t][avc-2]
  end

  res = 0
  while target >= 0 do
    res = res + ways2(target,avc-1)
    target = target - COINS[avc]
  end
  MEMO[t][avc-2] = res
end

WAYS = Hash[(0..AMOUNT).to_a.zip Array.new((0..AMOUNT).to_a.length, 0)]

def pb31d
  WAYS[0]=1
  for i in 1..8 do
    for j in COINS[i]..AMOUNT do
      WAYS[j] = WAYS[j] + WAYS[j-COINS[i]]
    end
  end
  puts WAYS[AMOUNT]
end


#puts Benchmark.measure {pb31}
#puts Benchmark.measure {pb31b}
#puts Benchmark.measure {pb31c}
puts Benchmark.measure {pb31d}

