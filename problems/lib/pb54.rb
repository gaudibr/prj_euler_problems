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



  def initialize cards
    raise IllegalHandError if cards.length !=5
    @counts = Hash.new
    @cards = cards.map{|e| Card.new(e)}
    @value = []

    Card.faces.each {|face| @counts[face] = 0}
    Card.suits.each {|suit| @counts[suit] = 0}

    cards.each {|card|
      face = card[0]
      suit = card[1]
      @counts[face] += 1; @counts[suit]+=1
    }
  end

  def <=>(another)
    @@results.index(self.define_hand) <=> @@results.index(another.define_hand)
  end

  def highest_face_value
    value = @counts.select{|k,v| Card.faces.include?(k) && v > 0}.map{|k,v| Card.faces.index(k)}.max + 2
    if (is_straight? && @counts['2'] > 0 && value == 14)
      value = 5
    end
    value
  end

  def is_four_oak?
    !@counts.select{|k,v| Card.faces.include?(k) && v==4}.empty?
  end

  def is_full_house?
    (!@counts.select{|k,v| Card.faces.include?(k) && v==2}.empty? && !@counts.select{|k,v| Card.faces.include?(k) && v==3}.empty?)
  end

  def is_flush?
    !@counts.select{|k,v| Card.suits.include?(k) && v==5}.empty?
  end

  def is_straight?
    (0..9).each {|i|
      sum = (0..4).inject(0) {|sum, j| @counts[@@straight_faces[i+j]] == 1 ? sum + 1 : sum + 0}
      return true if sum == 5
    }
    return false
  end

  def is_three_oak?
    (@counts.select{|k,v| Card.faces.include?(k) && v==2}.empty? && !@counts.select{|k,v| Card.faces.include?(k) && v==3}.empty?)
  end

  def is_double_pair?
    @counts.select{|k,v| Card.faces.include?(k) && v==2}.size == 2
  end

  def is_single_pair?
    @counts.select{|k,v| Card.faces.include?(k) && v==2}.size == 1
  end

  def is_high_card?
    @counts.select{|k,v| v==1}.size > 5 && !is_straight?
  end

  def define_hand
    straight = false
    flush = false
    if is_single_pair?
      return '1P'
    elsif is_double_pair?
      return '2P'
    elsif is_three_oak?
      return '3K'
    elsif is_full_house?
      return 'FH'
    elsif is_four_oak?
      return '4K'
    elsif is_flush?
      return is_straight? ? 'SF' : 'FL'
    elsif is_straight?
      'ST'
    else
      'HC'
    end
  end
end


def pbx
  poker_file = File.new("D:/ToBeSaved/s27 Documents/GitHub/prj_euler_problems/problems/lib/poker.txt", "r")
  plays = poker_file.readlines
  plays.each {|play|
    cards = play.split(' ')
    player1 = PokerHand.new cards.first(5)
    player2 = PokerHand.new cards.last(5)
  }
end

#puts Benchmark.measure { pbx }