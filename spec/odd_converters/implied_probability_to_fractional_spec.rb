require 'spec_helper'

describe ROdds::OddConverter::ImpliedProbabilityToFractional do

  it 'returns a fractional object' do
    implied_probability_odd = ROdds::Odd::ImpliedProbability.new(numerator: 1, denominator: 2)

    fractional_probability = ROdds::OddConverter::ImpliedProbabilityToFractional.call(implied_probability_odd)

    expect(fractional_probability).to be_an_instance_of(ROdds::Odd::Fractional)
  end
end
