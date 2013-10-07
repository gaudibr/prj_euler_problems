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