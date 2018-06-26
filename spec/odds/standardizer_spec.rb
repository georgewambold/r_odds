require 'spec_helper'

describe ROdds::Odd::Standardizer do
  it 'takes an odd as a string and returns an odd value object' do
    odd = 'some_odd'
    allow(ROdds::InferOddFormat).to receive(:of).with(odd: odd)
      .and_return(:some_format)
    standardized_odd = double('standardized_odd')
    some_standardizer = double('standardizer', call: standardized_odd)
    allow(ROdds::OddStandardizer::ClassFactory).to receive(:for).with(format: :some_format)
      .and_return(some_standardizer)

    result = ROdds::Odd::Standardizer.call(odd: odd)

    expect(result).to eq(standardized_odd)
  end
end
