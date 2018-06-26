require 'spec_helper'

describe ROdds::OddConverter::ImpliedProbabilityToDecimal do
  it 'converts an implied probability to a decimal' do
    implied_probability = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 2)

    decimal_probability = ROdds::OddConverter::ImpliedProbabilityToDecimal.call(implied_probability)

    expect(decimal_probability.to_s).to eq('2.00')
  end

  it 'converts an implied probability to a decimal' do
    implied_probability = ROdds::Odd::ImpliedProbability.new(numerator: 2, denominator: 3)

    decimal_probability = ROdds::OddConverter::ImpliedProbabilityToDecimal.call(implied_probability)

    expect(decimal_probability.to_s).to eq('1.50')
  end
end


