require 'pb54'
require 'debugger'


describe 'card' do
  it 'should properly compare cards' do
    PokerHand::Card.new('AH').should > PokerHand::Card.new('TH')
  end

  it 'should evaluate card equality' do
    PokerHand::Card.new('AH').should == PokerHand::Card.new('AC')
  end

  it 'should sort hands appropriately' do
    ['AD','2H','3C','4H','5S'].map{|e| PokerHand::Card.new(e)}.sort.should == ['2H','3C','4H','5S','AD'].map{|e| PokerHand::Card.new(e)}
  end

  it 'should evaluated card value' do
    PokerHand::Card.new('AS').value.should == 14

    PokerHand::Card.new('TS').value.should == 10
  end
end

describe 'hand evaluation' do
  before(:each) do
    @straight = ['AD','2H','3C','4H','5S']
    @straight2 = ['TD','JH','QC','KH','AS']
    @flush = ['2H','4H','6H','8H','KH']
    @four_oak = ['2H','2C','2S','2D','KH']
    @full_house = ['9D','9H','TC','TS','TD']
    @three_oak = ['KD','9H','TC','TS','TD']
    @double_pair = ['9D','9H','TC','TS','KD']
    @pair = ['9D','JH','QC','KH','KS']
    @high_card = ['9D','JH','QC','AH','KS']
  end


  it 'should recognise a flush' do
    #To change this template use File | Settings | File Templates.
    PokerHand.new(@flush).is_flush?.should == true
    PokerHand.new(@high_card).is_flush?.should == false
  end

  it 'should recognise a straight' do
    #To change this template use File | Settings | File Templates.
    PokerHand.new(@straight).is_straight?.should == true
    PokerHand.new(@straight2).is_straight?.should == true
    PokerHand.new(@pair).is_straight?.should == false
  end

  it 'should get the highest value correctly' do
    PokerHand.new(@straight).highest_face_value.should == 5
    PokerHand.new(@straight2).highest_face_value.should == 14
    PokerHand.new(@flush).highest_face_value.should == 13
    PokerHand.new(@pair).highest_face_value.should == 13

  end

  it 'should detect a 4 of a kind' do
    PokerHand.new(@four_oak).is_four_oak?.should == true
    PokerHand.new(@pair).is_four_oak?.should == false
  end

  it 'should detect a full house' do
    PokerHand.new(@full_house).is_full_house?.should == true
    PokerHand.new(@pair).is_full_house?.should == false
  end

  it 'should detect a three of a kind' do
    PokerHand.new(@three_oak).is_three_oak?.should == true
    PokerHand.new(@full_house).is_three_oak?.should == false
  end

  it 'should detect a double pair' do
    PokerHand.new(@double_pair).is_double_pair?.should == true
    PokerHand.new(@pair).is_double_pair?.should == false
  end

  it 'should detect a single pair' do
    PokerHand.new(@pair).is_single_pair?.should == true
    PokerHand.new(@double_pair).is_single_pair?.should == false
  end

  it 'should detect a high card' do
    PokerHand.new(@high_card).is_high_card?.should == true
    PokerHand.new(@pair).is_high_card?.should == false
    PokerHand.new(@double_pair).is_high_card?.should == false
    PokerHand.new(@straight).is_high_card?.should == false
    PokerHand.new(@flush).is_high_card?.should == false
  end

  it 'should accurately define the hand' do
    PokerHand.new(@high_card).define_hand.should == 'HC'
    PokerHand.new(@straight).define_hand.should == 'ST'
    PokerHand.new(@double_pair).define_hand.should == '2P'
    PokerHand.new(@flush).define_hand.should == 'FL'
    PokerHand.new(@four_oak).define_hand.should == '4K'
    PokerHand.new(@three_oak).define_hand.should == '3K'
    PokerHand.new(@pair).define_hand.should == '1P'
    PokerHand.new(@full_house).define_hand.should == 'FH'
  end
end

describe 'hand comparison' do
  before(:each) do
    @straight = ['AD','2H','3C','4H','5S']
    @straight2 = ['TD','JH','QC','KH','AS']
    @flush = ['2H','4H','6H','8H','KH']
    @four_oak = ['2H','2C','2S','2D','KH']
    @full_house = ['9D','9H','TC','TS','TD']
    @three_oak = ['KD','9H','TC','TS','TD']
    @double_pair = ['9D','9H','TC','TS','KD']
    @pair = ['9D','JH','QC','KH','KS']
    @high_card = ['9D','JH','QC','AH','KS']
  end
  it 'should define what type of hand beats the other' do
    PokerHand.new(@double_pair).should > PokerHand.new(@pair)
    PokerHand.new(@pair).should > PokerHand.new(@high_card)
    PokerHand.new(@pair).should == PokerHand.new(@pair)
  end
end
