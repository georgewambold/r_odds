require 'spec_helper'

describe ROdds::Odd::Decimal do
  it 'has a :format method' do
    decimal = ROdds::Odd::Decimal.new(value: 2.to_r)

    expect(decimal.format).to eq(:decimal)
  end

  it 'has a :to_s method' do
    decimal = ROdds::Odd::Decimal.new(value: 2.to_r)

    expect(decimal.to_s).to eq('2.00')
  end

  it 'prints decimals if they exist' do
    decimal = ROdds::Odd::Decimal.new(value: 2.10.rationalize)

    expect(decimal.to_s).to eq('2.10')
  end

  it 'prints decimals if they exist up to two places' do
    decimal = ROdds::Odd::Decimal.new(value: 2.115.rationalize)

    expect(decimal.to_s).to eq('2.12')
  end

  describe '#as_rational' do
    it 'returns the decimal value as a rational fraction' do
      decimal = ROdds::Odd::Decimal.new(value: 2.10.rationalize)

      expect(decimal.as_rational).to eq(Rational(21,10))
    end

    it 'returns a complex decimal value as a rational fraction' do
      decimal = ROdds::Odd::Decimal.new(value: 92.1148.rationalize)

      expect(decimal.as_rational).to eq(Rational(921148,10000))
    end
  end
end

