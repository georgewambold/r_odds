require 'spec_helper'

describe ROdds::OddConverter::DecimalToImpliedProbability do
 it 'has an odd converter interface' do
   decimal = ROdds::Odd::Decimal.new(value: Rational(15,1))

   implied_probability = ROdds::OddConverter::DecimalToImpliedProbability.call(decimal)

   expect(implied_probability).to be_an_instance_of(ROdds::Odd::ImpliedProbability)
 end

  it 'calculates the implied probability accurately' do
    decimal = ROdds::Odd::Decimal.new(value: Rational(15,10))

    implied_probability = ROdds::OddConverter::DecimalToImpliedProbability.call(decimal)

    expect(implied_probability.to_s).to eq('66.67%')
  end
end

