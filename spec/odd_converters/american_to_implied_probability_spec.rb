require 'spec_helper'

describe ROdds::OddConverter::AmericanToImpliedProbability do
  it 'can accurately handle a negative american odd' do
    american = ROdds::Odd::American.new(value: -400.to_r)

    implied_probability = ROdds::OddConverter::AmericanToImpliedProbability.call(american)

    expect(implied_probability.to_s).to eq('80.0%')
  end

  it 'can accurately handle a positive american odd' do
    american = ROdds::Odd::American.new(value: 900.to_r)

    implied_probability = ROdds::OddConverter::AmericanToImpliedProbability.call(american)

    expect(implied_probability.to_s).to eq('10.0%')
  end
end
