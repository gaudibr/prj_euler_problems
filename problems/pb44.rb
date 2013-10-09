class Integer
  def Integer.pentagonal n
    n*(3*n-1)/2
  end
end


(1..10).each {|i| puts Integer.pentagonal(i)}