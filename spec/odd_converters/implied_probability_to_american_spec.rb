require 'spec_helper'

describe ROdds::OddConverter::ImpliedProbabilityToAmerican do
  it 'can return negative american odds' do
    implied_probability  = ROdds::Odd::ImpliedProbability.new(numerator: 3, denominator: 4)

    american_probability = ROdds::OddConverter::ImpliedProbabilityToAmerican.call(implied_probability)


    expect(american_probability.to_s).to eq("-300")
  end

  it 'returns positive american odds object' do
    implied_probability  = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 2)

    american_probability = ROdds::OddConverter::ImpliedProbabilityToAmerican.call(implied_probability)

    expect(american_probability.to_s).to eq("+100")
  end

  it 'returns another positive american odd' do
    implied_probability  = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 100)

    american_probability = ROdds::OddConverter::ImpliedProbabilityToAmerican.call(implied_probability)

    expect(american_probability.to_s).to eq("+9900")
  end
end
