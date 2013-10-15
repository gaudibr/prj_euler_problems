require 'pb52'
require 'debugger'

describe 'Same Digits' do

  it 'numbers should have the same amount of digits' do

    #To change this template use File | Settings | File Templates.
    12345.same_digits?(112345).should == false
    12345.same_digits?(54321).should == true
  end
end