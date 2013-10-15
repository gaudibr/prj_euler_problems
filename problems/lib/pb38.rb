class Array

  def pandigital?
    b = self.join

    if b.split('').uniq.length == 9
      return true
    end if b.length == 9 && /0/!~b
  end

  def distinct?
    self.uniq==self
  end
end

class Integer
  def pandigital?
    self.to_s.split('').pandigital?
  end
  def distinct_digits?
    self.to_s.split('').distinct?
  end
end



pdp = []
(9123..9876).each {|e|
  if e.distinct_digits?
    s = ""
    (1..2).each { |f|
     s.concat((e*f).to_s)
    }
    pdp << s.to_i if s.to_i.pandigital?
  end

}

puts pdp.max


