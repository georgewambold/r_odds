require 'spec_helper'

describe ROdds::GenericOdd do
  it 'is initialized with an implied probability instance' do
    implied_probability = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 2)

    expect {
      ROdds::GenericOdd.new(implied_probability: implied_probability)
    }.to_not raise_error
  end

  describe '#as_implied_probability' do
    it 'returns the same implied probability that was passed in' do
      implied_probability = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 2)

      generic_odd = ROdds::GenericOdd.new(implied_probability: implied_probability)

      expect(generic_odd.as_implied_probability).to eq(implied_probability)
    end
  end

  describe '#as_fractional' do
    it 'calls the correct odds converter' do
      implied_probability = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 2)
      allow(ROdds::OddConverter::ImpliedProbabilityToFractional).to receive(:call)

      generic_odd = ROdds::GenericOdd.new(implied_probability: implied_probability)
      generic_odd.as_fractional

      expect(ROdds::OddConverter::ImpliedProbabilityToFractional).to have_received(:call)
        .with(implied_probability)
    end

    it 'returns whatever that converter returns' do
      implied_probability = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 2)
      fractional_odd      = double('fractional odd')
      allow(ROdds::OddConverter::ImpliedProbabilityToFractional).to receive(:call)
        .and_return(fractional_odd)

      generic_odd = ROdds::GenericOdd.new(implied_probability: implied_probability)

      expect(generic_odd.as_fractional).to eq(fractional_odd)
    end
  end

  describe '#as_american' do
    it 'calls the correct odds converter' do
      implied_probability = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 2)
      allow(ROdds::OddConverter::ImpliedProbabilityToAmerican).to receive(:call)

      generic_odd = ROdds::GenericOdd.new(implied_probability: implied_probability)
      generic_odd.as_american

      expect(ROdds::OddConverter::ImpliedProbabilityToAmerican).to have_received(:call)
        .with(implied_probability)
    end

    it 'returns whatever that converter returns' do
      implied_probability = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 2)
      american_odd        = double('american odd')
      allow(ROdds::OddConverter::ImpliedProbabilityToAmerican).to receive(:call)
        .and_return(american_odd)

      generic_odd = ROdds::GenericOdd.new(implied_probability: implied_probability)

      expect(generic_odd.as_american).to eq(american_odd)
    end
  end

  describe '#as_decimal' do
    it 'calls the correct odds converter' do
      implied_probability = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 2)
      allow(ROdds::OddConverter::ImpliedProbabilityToDecimal).to receive(:call)

      generic_odd = ROdds::GenericOdd.new(implied_probability: implied_probability)
      generic_odd.as_decimal

      expect(ROdds::OddConverter::ImpliedProbabilityToDecimal).to have_received(:call)
        .with(implied_probability)
    end

    it 'returns whatever that converter returns' do
      implied_probability = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 2)
      decimal_odd        = double('decimal odd')
      allow(ROdds::OddConverter::ImpliedProbabilityToDecimal).to receive(:call)
        .and_return(decimal_odd)

      generic_odd = ROdds::GenericOdd.new(implied_probability: implied_probability)

      expect(generic_odd.as_decimal).to eq(decimal_odd)
    end
  end

  describe '#rational_implied_probability' do
    it 'returns the implied probability as a rational' do
      implied_probability = double('implied probability', fraction: Rational(1,2))

      generic_odd = ROdds::GenericOdd.new(implied_probability: implied_probability)

      expect(generic_odd.rational_implied_probability).to eq(Rational(1,2))
    end
  end
end
