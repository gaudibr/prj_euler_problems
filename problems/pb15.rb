def lattice_paths(n)
  map_sum = Hash.new
  map_previous = Hash.new
  for i in 0..n
    for j in 0..n
      sum = i+j
      a = [i,j]
      map_sum[sum] == nil ? map_sum[sum] = [[i,j]] : map_sum[sum].push([i,j])
      map_previous[a] = []
      if (i-1) >= 0
        map_previous[a].push([i-1,j])
      end
      if (j-1) >= 0
        map_previous[a].push([i,j-1])
      end
    end
  end
  map_count = Hash.new
  for i in 0..2*n
    map_sum[i].each do |point|
      if map_previous[point].empty?
        map_count[point] = 0
      else
        count = 0
        map_previous[point].each do |previous_point|
          if map_count[previous_point] == 0
            count = 1
          else
            count = map_count[previous_point]
          end
          map_count[point] == nil ? map_count[point] = count : map_count[point] += count
        end
      end
    end
  end
  return map_count[[n,n]]
end

puts lattice_paths(20)

