require 'spec_helper'

describe ROdds::Odd::American do
  it 'has a value attribute' do
    odd = ROdds::Odd::American.new(value: -400.to_r)

    expect(odd.value).to eq(-400)
  end

  it 'has raises an error if the value passed in is not a float' do
    expect {
      ROdds::Odd::American.new(value: -400.0)
    }.to raise_error(ArgumentError)
  end

  it 'has a :format method' do
    format = ROdds::Odd::American.new(value: -400.to_r).format

    expect(format).to eq(:american)
  end

  it 'has a :to_s method' do
    american_string = ROdds::Odd::American.new(value: +200.to_r).to_s

    expect(american_string).to eq('+200')
  end

  describe '#negative?' do
    it 'returns true if the value of the american odd is negative' do
      odd = ROdds::Odd::American.new(value: -400.to_r)

      expect(odd.negative?).to be(true)
    end

    it 'returns false if the value of the american odd is positive' do
      odd = ROdds::Odd::American.new(value: +400.to_r)

      expect(odd.negative?).to be(false)
    end
  end
end
