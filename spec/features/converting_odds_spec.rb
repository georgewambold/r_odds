require 'spec_helper'

describe 'converting odds' do
  it 'can take an odd and return it in a specified format' do
    original_odd = '-110'

    new_odd = ROdds.convert(original_odd, to: :american)

    expect(new_odd).to eq('-110')
  end

  it 'can recognize american odds without the sign' do
    original_odd = '110'

    new_odd = ROdds.convert(original_odd, to: :american)

    expect(new_odd).to eq('+110')
  end

  it 'can have the :from argument specified to override the infered format' do
    odd_that_looks_fractional = '1/2'
    actual_odd_format         = :implied_probability

    new_odd = ROdds.convert(odd_that_looks_fractional, from: actual_odd_format, to: :american)

    expect(new_odd).to eq('+100')
  end
end
