require 'spec_helper'

describe ROdds::Odd::Fractional do
  it 'has a :format method' do
    format = ROdds::Odd::Fractional.new(numerator: 1, denominator: 2).format

    expect(format).to eq(:fractional)
  end

  it 'has a :to_s method' do
    fractional_string = ROdds::Odd::Fractional.new(numerator: 1, denominator: 2).to_s

    expect(fractional_string).to eq('1/2')
  end

  it 'has a numerator attribute' do
    odd = ROdds::Odd::Fractional.new(numerator: 20, denominator: 10)

    expect(odd.numerator).to eq(20)
  end

  it 'has a denominator attribute' do
    odd = ROdds::Odd::Fractional.new(numerator: 20, denominator: 10)

    expect(odd.denominator).to eq(10)
  end
end
