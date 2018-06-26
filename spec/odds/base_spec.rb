require 'spec_helper'

describe ROdds::Odd::Base do
  class TestOdd < ROdds::Odd::Base

  end

  it 'raises an error if the subclass does not impliment :format' do
    expect {
      TestOdd.new.format
    }.to raise_error(NotImplementedError)
  end

  it 'raises an error if the subclass does not impliment :to_s' do
    expect {
      TestOdd.new.to_s
    }.to raise_error(NotImplementedError)
  end
end

