require 'spec_helper'

describe ROdds::OddStandardizer::Fractional do
  it 'takes an odd param' do
    ROdds::OddStandardizer::Fractional.call(odd: '1/3')
  end

  it 'returns a fractional odd object' do
    standardized_odd = ROdds::OddStandardizer::Fractional.call(odd: '1/3')

    expect(standardized_odd).to be_an_instance_of(ROdds::Odd::Fractional)
  end

  it 'returns a fractional odd object with the same odd properties as the string passed in' do
    allow(ROdds::Odd::Fractional).to receive(:new)

    standardized_odd = ROdds::OddStandardizer::Fractional.call(odd: '1/3')

    expect(ROdds::Odd::Fractional).to have_received(:new)
      .with(numerator: 1, denominator: 3)
  end

  it 'returns a reduced fraction' do
    allow(ROdds::Odd::Fractional).to receive(:new)

    standardized_odd = ROdds::OddStandardizer::Fractional.call(odd: '3/6')

    expect(ROdds::Odd::Fractional).to have_received(:new)
      .with(numerator: 1, denominator: 2)
  end

  it 'can handle decmial points in numerator' do
    allow(ROdds::Odd::Fractional).to receive(:new)

    standardized_odd = ROdds::OddStandardizer::Fractional.call(odd: '1.5-1')

    expect(ROdds::Odd::Fractional).to have_received(:new)
      .with(numerator: 3, denominator: 2)
  end

  it 'can handle decmial points in the denominator' do
    allow(ROdds::Odd::Fractional).to receive(:new)

    standardized_odd = ROdds::OddStandardizer::Fractional.call(odd: '2.5-1.5')

    expect(ROdds::Odd::Fractional).to have_received(:new)
      .with(numerator: 5, denominator: 3)
  end

  it "can handle fractional odds with the 'to' format" do
    allow(ROdds::Odd::Fractional).to receive(:new)

    standardized_odd = ROdds::OddStandardizer::Fractional.call(odd: '4 to 3')

    expect(ROdds::Odd::Fractional).to have_received(:new)
      .with(numerator: 4, denominator: 3)
  end

  it "can handle fractional odds with the '-to-' format" do
    allow(ROdds::Odd::Fractional).to receive(:new)

    standardized_odd = ROdds::OddStandardizer::Fractional.call(odd: '4-to-3')

    expect(ROdds::Odd::Fractional).to have_received(:new)
      .with(numerator: 4, denominator: 3)
  end

  it "can handle fractional odds with the '-' format" do
    allow(ROdds::Odd::Fractional).to receive(:new)

    standardized_odd = ROdds::OddStandardizer::Fractional.call(odd: '4-3')

    expect(ROdds::Odd::Fractional).to have_received(:new)
      .with(numerator: 4, denominator: 3)
  end
end
