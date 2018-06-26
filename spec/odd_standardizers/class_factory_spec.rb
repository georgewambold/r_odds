require 'spec_helper'

describe ROdds::OddStandardizer::ClassFactory do
  it 'raises an error on an unknown format' do
    unknown_format = :foo_bar

    expect {
      ROdds::OddStandardizer::ClassFactory.for(format: unknown_format)
    }.to raise_error(ArgumentError)
  end

  it 'returns the fractional standardizer if passed the format :fractional' do
    format = :fractional

    standardizer_class = ROdds::OddStandardizer::ClassFactory.for(format: format)

    expect(standardizer_class).to eq(ROdds::OddStandardizer::Fractional)
  end

  it 'returns the american standardizer if passed the format :american' do
    format = :american

    standardizer_class = ROdds::OddStandardizer::ClassFactory.for(format: format)

    expect(standardizer_class).to eq(ROdds::OddStandardizer::American)
  end

  it 'returns the implied_probability standardizer if passed the format :implied_probability' do
    format = :implied_probability

    standardizer_class = ROdds::OddStandardizer::ClassFactory.for(format: format)

    expect(standardizer_class).to eq(ROdds::OddStandardizer::ImpliedProbability)
  end

  it 'returns the decimal standardizer if passed the format :decimal' do
    format = :decimal

    standardizer_class = ROdds::OddStandardizer::ClassFactory.for(format: format)

    expect(standardizer_class).to eq(ROdds::OddStandardizer::Decimal)
  end
end
