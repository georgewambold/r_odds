require 'spec_helper'

describe ROdds::OddConverter::ImpliedProbabilityToImpliedProbability do
  it 'returns the odd given to it' do
    odd = double('implied_probability')

    converted_odd = ROdds::OddConverter::ImpliedProbabilityToImpliedProbability.call(odd)

    expect(converted_odd).to eq(odd)
  end
end
