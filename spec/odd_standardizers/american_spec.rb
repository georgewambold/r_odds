require 'spec_helper'

describe ROdds::OddStandardizer::American do
  it 'returns an american odd object' do
    standardized_odd = ROdds::OddStandardizer::American.call(odd: '+100')

    expect(standardized_odd).to be_an_instance_of(ROdds::Odd::American)
  end

  it 'casts the string argument to a float before passing it to the odd initializer' do
    allow(ROdds::Odd::American).to receive(:new)

    standardized_odd = ROdds::OddStandardizer::American.call(odd: '+110')

    expect(ROdds::Odd::American).to have_received(:new)
      .with(value: Rational(110, 1))
  end

  it 'can cast strings with decimals to floats' do
    allow(ROdds::Odd::American).to receive(:new)

    standardized_odd = ROdds::OddStandardizer::American.call(odd: '+110.01')

    expect(ROdds::Odd::American).to have_received(:new)
      .with(value: Rational(11001, 100))
  end

  it 'can cast negative strings to floats' do
    allow(ROdds::Odd::American).to receive(:new)

    standardized_odd = ROdds::OddStandardizer::American.call(odd: '-200')

    expect(ROdds::Odd::American).to have_received(:new)
      .with(value: Rational(-200, 1))
  end
end

