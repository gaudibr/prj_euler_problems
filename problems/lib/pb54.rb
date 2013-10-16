require 'benchmark'

class IllegalHandError < StandardError ; end

class PokerHand
  include Comparable

  class Card
    include Comparable
    @@faces = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
    @@suits = [ 'S', 'C', 'D', 'H' ] # Spades, Clubs, Diamonds, Hearts

    attr_reader :face, :suit

    def initialize card
      @face = card[0]
      @suit = card[1]
    end

    def <=>(another)
      @@faces.index(self.face) <=> @@faces.index(another.face)
    end

    def value
      @@faces.index(self.face) + 2
    end
    def self.faces
      @@faces
    end
    def self.suits
      @@suits
    end
  end

  @@straight_faces = "A23456789TJQKA"
  @@results = ['HC','1P','2P','3K','ST','FL','FH','4K','SF']

  attr_reader :value



  def initialize cards
    raise IllegalHandError if cards.length !=5
    @face_counts = Hash.new
    @suit_counts = Hash.new
    @cards = cards.map{|e| Card.new(e)}
    @value = []

    Card.faces.each {|face| @face_counts[face] = 0}
    Card.suits.each {|suit| @suit_counts[suit] = 0}

    cards.each {|card|
      face = card[0]
      suit = card[1]
      @face_counts[face] += 1; @suit_counts[suit]+=1
    }
  end

  def <=>(another)
    (0..@value.length).each { |i|
      result =  self.value[i] <=> another.value[i]
      return result unless result==0
    }
    #@@results.index(self.define_hand) <=> @@results.index(another.define_hand)
  end

  def highest_face_value
    value = @face_counts.select{|k,v| v > 0}.map{|k,v| Card.faces.index(k)}.max + 2
    if (is_straight? && @face_counts['2'] > 0 && value == 14)
      value = 5
    end
    value
  end

  def is_four_oak?
    !@face_counts.select{|k,v| v==4}.empty?
  end

  def is_full_house?
    (!@face_counts.select{|k,v| v==2}.empty? && !@face_counts.select{|k,v| v==3}.empty?)
  end

  def is_flush?
    @suit_counts.any? {|k,v| v==5}
  end

  def is_straight?
    (0..9).each {|i|
      sum = (0..4).inject(0) {|sum, j| @face_counts[@@straight_faces[i+j]] == 1 ? sum + 1 : sum + 0}
      return true if sum == 5
    }
    return false
  end

  def is_three_oak?
    (@face_counts.select{|k,v| v==2}.empty? && !@face_counts.select{|k,v| v==3}.empty?)
  end

  def is_double_pair?
    @face_counts.select{|k,v| v==2}.size == 2
  end

  def is_single_pair?
    @face_counts.select{|k,v| v==2}.size == 1 && @face_counts.select{|k,v| v>1 && v!=2}.empty?
  end

  def is_high_card?
    @face_counts.select{|k,v| v==1}.size == 5 && !is_straight? && !is_flush?
  end

  def define_hand
    straight = false
    flush = false
    if is_single_pair?
      @value << @@results.index('1P')
      @value.concat @face_counts.select{|k,v| v == 2}.keys.map{|e| Card.faces.index(e) +2}
      @value.concat @face_counts.select{|k,v| v == 1}.keys.map{|e| Card.faces.index(e) +2}.sort.reverse
      return '1P'
    elsif is_double_pair?
      @value << @@results.index('2P')
      @value.concat @face_counts.select{|k,v| v == 2}.keys.map{|e| Card.faces.index(e) +2}.sort.reverse
      @value.concat @face_counts.select{|k,v| v == 1}.keys.map{|e| Card.faces.index(e) +2}.sort.reverse
      return '2P'
    elsif is_three_oak?
      @value << @@results.index('3K')
      @value.concat @face_counts.select{|k,v| v == 3}.keys.map{|e| Card.faces.index(e) +2}
      @value.concat @face_counts.select{|k,v| v == 1}.keys.map{|e| Card.faces.index(e) +2}.sort.reverse
      return '3K'
    elsif is_full_house?
      @value << @@results.index('FH')
      @value.concat @face_counts.select{|k,v| v == 3}.keys.map{|e| Card.faces.index(e) +2}
      @value.concat @face_counts.select{|k,v| v == 2}.keys.map{|e| Card.faces.index(e) +2}
      return 'FH'
    elsif is_four_oak?
      @value << @@results.index('4K')
      @value.concat @face_counts.select{|k,v| v == 4}.keys.map{|e| Card.faces.index(e) +2}
      @value.concat @face_counts.select{|k,v| v == 1}.keys.map{|e| Card.faces.index(e) +2}
      return '4K'
    elsif is_flush?
      @value << @@results.index('FL')
      @value.concat @face_counts.select{|k,v| v == 1}.keys.map{|e| Card.faces.index(e) +2}.sort.reverse
      if is_straight?
        @value.replace([@@results.index('SF')])
        @value << highest_face_value
        return 'SF'
      end
      return 'FL'
    elsif is_straight?
      @value << @@results.index('ST')
      @value << highest_face_value
      'ST'
    else
      @value << @@results.index('HC')
      @value.concat @face_counts.select{|k,v| v == 1}.keys.map{|e| Card.faces.index(e) +2}.sort.reverse
      'HC'
    end
  end
end


def pbx
  poker_file = File.new("D:/ToBeSaved/s27 Documents/GitHub/prj_euler_problems/problems/lib/poker.txt", "r")
  plays = poker_file.readlines
  puts plays.map{|play| play.split(' ')}.count{|cards| PokerHand.new(cards.first(5)) > PokerHand.new(cards.last(5))}
  puts plays.map{|play| play.split(' ')}.count{|cards| PokerHand.new(cards.first(5)) == PokerHand.new(cards.last(5))}

end

#puts Benchmark.measure { pbx }