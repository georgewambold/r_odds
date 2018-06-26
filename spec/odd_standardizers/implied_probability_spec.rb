require 'spec_helper'

describe ROdds::OddStandardizer::ImpliedProbability do
  it 'standardizes a full percentage' do
    raw_odd = '55%'

    implied_probability = ROdds::OddStandardizer::ImpliedProbability.call(odd: raw_odd)

    expect(implied_probability.to_s).to eq('55.0%')
  end

  it 'standardizes a decimal percentage' do
    raw_odd = '.75%'

    implied_probability = ROdds::OddStandardizer::ImpliedProbability.call(odd: raw_odd)

    expect(implied_probability.to_s).to eq('0.75%')
  end

  it 'standardizes fractional probabilities' do
    raw_odd = '3/4'

    implied_probability = ROdds::OddStandardizer::ImpliedProbability.call(odd: raw_odd)

    expect(implied_probability.to_s).to eq('75.0%')
  end

  it 'standardizes fractional probabilities' do
    raw_odd = '3/4'

    implied_probability = ROdds::OddStandardizer::ImpliedProbability.call(odd: raw_odd)

    expect(implied_probability.to_s).to eq('75.0%')
  end

  it 'standardizes fractional probabilities' do
    raw_odd = '0/1'

    implied_probability = ROdds::OddStandardizer::ImpliedProbability.call(odd: raw_odd)

    expect(implied_probability.to_s).to eq('0.0%')
  end
end
