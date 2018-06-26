require 'spec_helper'

describe ROdds::OddConverter::ClassFactory do
  it 'raises an error when given an unknown to: or from:' do
    expect {
      odd_conversion_class = ROdds::OddConverter::ClassFactory.call(from: :fractional, to: :foobar)
    }.to raise_error(ArgumentError)
  end

  context 'to: :implied_probability' do
    context 'from: :fractional' do
      it 'returns the fractional to implied_probability converter' do
        odd_conversion_class = ROdds::OddConverter::ClassFactory.call(
          from: :fractional,
          to:   :implied_probability
        )

        expect(odd_conversion_class).to eq(ROdds::OddConverter::FractionalToImpliedProbability)
      end
    end

    context 'from: :american' do
      it 'returns the american to implied_probability converter' do
        odd_conversion_class = ROdds::OddConverter::ClassFactory.call(
          from: :american,
          to:   :implied_probability
        )

        expect(odd_conversion_class).to eq(ROdds::OddConverter::AmericanToImpliedProbability)
      end
    end

    context 'from: :implied_probability' do
      it 'returns the american to implied_probability converter' do
        odd_conversion_class = ROdds::OddConverter::ClassFactory.call(
          from: :implied_probability,
          to:   :implied_probability
        )

        expect(odd_conversion_class).to eq(ROdds::OddConverter::ImpliedProbabilityToImpliedProbability)
      end
    end

    context 'from: :decimal' do
      it 'returns the decimal to implied_probability converter' do
        odd_conversion_class = ROdds::OddConverter::ClassFactory.call(
          from: :decimal,
          to:   :implied_probability
        )

        expect(odd_conversion_class).to eq(ROdds::OddConverter::DecimalToImpliedProbability)
      end
    end
  end
  context 'to: :american' do
    context 'from: :implied_probability' do
      it 'returns the implied probability to american converter' do
        odd_conversion_class = ROdds::OddConverter::ClassFactory.call(
          from: :implied_probability,
          to:   :american
        )

        expect(odd_conversion_class).to eq(ROdds::OddConverter::ImpliedProbabilityToAmerican)
      end
    end
  end

  context 'to: :decimal' do
    context 'from: :implied_probability' do
      it 'returns the implied probability to decimal converter' do
        odd_conversion_class = ROdds::OddConverter::ClassFactory.call(
          from: :implied_probability,
          to:   :decimal
        )

        expect(odd_conversion_class).to eq(ROdds::OddConverter::ImpliedProbabilityToDecimal)
      end
    end
  end

  context 'to: :fractional' do
    context 'from: :implied_probability' do
      it 'returns the implied probability to fractional converter' do
        odd_conversion_class = ROdds::OddConverter::ClassFactory.call(
          from: :implied_probability,
          to:   :fractional
        )

        expect(odd_conversion_class).to eq(ROdds::OddConverter::ImpliedProbabilityToFractional)
      end
    end
  end
end

