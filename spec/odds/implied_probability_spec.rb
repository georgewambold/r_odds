require 'spec_helper'

describe ROdds::Odd::ImpliedProbability do
  it 'has a numerator attribute' do
    odd = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 3)

    expect(odd.numerator).to eq(1)
  end

  it 'has a denominator attribute' do
    odd = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 3)

    expect(odd.denominator).to eq(3)
  end

  it 'has a :to_s method' do
    odd = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 3)

    expect(odd.to_s).to eq('33.33%')
  end

  it 'has a :format method' do
    odd = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 3)

    expect(odd.format).to eq(:implied_probability)
  end

  describe '#greater_than_50_percent?' do
    it 'returns false if the implied probability is .01' do
      odd = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 100)

      expect(odd.greater_than_50_percent?).to eq(false)
    end

    it 'returns false if the implied probability is .5' do
      odd = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 2)

      expect(odd.greater_than_50_percent?).to eq(false)
    end

    it 'returns true if the implied probability is .5001' do
      odd = ROdds::Odd::ImpliedProbability.new(numerator: 5001, denominator: 10000)

      expect(odd.greater_than_50_percent?).to eq(true)
    end

    it 'returns true if the implied probability is 1.0' do
      odd = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 1)

      expect(odd.greater_than_50_percent?).to eq(true)
    end
  end
end
