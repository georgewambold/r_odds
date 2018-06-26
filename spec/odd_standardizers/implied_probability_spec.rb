require 'spec_helper'

describe ROdds::OddStandardizer::ImpliedProbability do
  it 'standardizes implied probability oddj' do
    raw_odd = '55%'

    implied_probability = ROdds::OddStandardizer::ImpliedProbability.call(odd: raw_odd)

    expect(implied_probability.to_s).to eq('55.0%')
  end

  it 'standardizes a different implied probability oddk' do
    raw_odd = '.75%'

    implied_probability = ROdds::OddStandardizer::ImpliedProbability.call(odd: raw_odd)

    expect(implied_probability.to_s).to eq('0.75%')
  end
end
