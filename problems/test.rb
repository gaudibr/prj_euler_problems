$ok = []
def prob(*args)
  prod = args.inject(0) {|r,i| r+i**5}
  return if $ok.include? prod
  $ok << prod if args.sort == prod.to_s.split(//).map{|i| i.to_i}.sort
end
(0..9).each do |a|
  (a..9).each do |b|
    prob(a,b)
    (b..9).each do |c|
      prob(a,b,c)
      (c..9).each do |d|
   prob(a,b,c,d)
   (d..9).each do |e|
     prob(a,b,c,d,e)
     (e..9).each do |f|
       prob(a,b,c,d,e,f)
     end
   end
      end
    end
  end
end
p $ok.inject(0) {|r,i|r+i}