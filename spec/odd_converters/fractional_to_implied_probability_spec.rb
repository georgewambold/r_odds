require 'spec_helper'

describe ROdds::OddConverter::FractionalToImpliedProbability do
  it 'returns an implied_probability object' do
    fractional_odd = ROdds::Odd::Fractional.new(numerator: 1, denominator: 2)

    implied_probability = ROdds::OddConverter::FractionalToImpliedProbability.call(fractional_odd)

    expect(implied_probability).to be_an_instance_of(ROdds::Odd::ImpliedProbability)
  end
end
