p_max = 1000

triangles = {}
p_max.downto((p_max/2)) do |perimeter|
    (perimeter/2).downto(perimeter/3) do |hip|
      (perimeter-hip-1).downto((perimeter-hip)/2) do |cat1|
        cat2 = perimeter-hip-cat1
        triangle = [hip ,cat1, cat2]
        if ! triangles[perimeter]
          triangles[perimeter] = [triangle]
        else
          triangles[perimeter] << triangle
        end if hip**2 == (cat1**2+cat2**2)

      end
    end
end

puts triangles.max_by { |k,v| v.length}
puts triangles.select {|k,v| v.length > 4}.to_s
