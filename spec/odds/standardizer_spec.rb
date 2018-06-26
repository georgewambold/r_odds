require 'spec_helper'

describe ROdds::Odd::Standardizer do
  it 'can infer the format of an odd and standardize it' do
    decimal_odd = '1.25'

    standardized_odd = ROdds::Odd::Standardizer.call(odd: decimal_odd)

    expect(standardized_odd).to be_an_instance_of(ROdds::Odd::Decimal)
  end

  it 'maintains the value of the odd' do
    decimal_odd = '1.25'

    standardized_odd = ROdds::Odd::Standardizer.call(odd: decimal_odd)

    expect(standardized_odd.to_s).to eq('1.25')
  end

  it 'can also have the format of the odd specified' do
    non_descript_odd = '1/2'
    format = :implied_probability

    standardized_odd = ROdds::Odd::Standardizer.call(
      odd: non_descript_odd,
      format: format
    )

    expect(standardized_odd).to be_an_instance_of(ROdds::Odd::ImpliedProbability)
  end
end
