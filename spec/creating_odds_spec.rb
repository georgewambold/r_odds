require 'spec_helper'

describe 'creating odds' do
  it 'will raise an error if passed nil' do
    expect {
      ROdds.create_odd(nil)
    }.to raise_error(ArgumentError)
  end

  it 'will raise an error if passed a badly formatted odd' do
    expect {
      ROdds.create_odd('asdfxc1imxs1')
    }.to raise_error(ArgumentError)
  end

  context 'from fractional' do
    it 'creates an odd from a fractional string and returns an implied probability when asked for it' do
      new_odd = ROdds.create_odd('1/2')

      implied_probability = new_odd.as_implied_probability

      expect(implied_probability.to_s).to eq("66.67%")
    end

    it 'creates an odd from a fractional string and returns fractional odds when asked for it' do
      new_odd = ROdds.create_odd('1/2')

      fractional_probability = new_odd.as_fractional

      expect(fractional_probability.to_s).to eq('1/2')
    end

    it 'creates an odd from a fractional string and returns american odds when asked for it' do
      new_odd = ROdds.create_odd('1/2')

      american_probability = new_odd.as_american

      expect(american_probability.to_s).to eq('-200')
    end

    it 'creates an odd from a fractional string and returns decimal odds when asked for it' do
      new_odd = ROdds.create_odd('1/2')

      decimal_probability = new_odd.as_decimal

      expect(decimal_probability.to_s).to eq('1.50')
    end
  end

  context 'from american' do
    it 'creates an odd from an american odd string and returns an implied probability when asked for it' do
      new_odd = ROdds.create_odd('-300.0')

      implied_probability = new_odd.as_implied_probability

      expect(implied_probability.to_s).to eq("75.0%")
    end
  end

  context 'from decimal' do
    it 'creates an odd from a decimal string and returns an implied probability when asked for it' do
      new_odd = ROdds.create_odd('1.25')

      implied_probability = new_odd.as_implied_probability

      expect(implied_probability.to_s).to eq("80.0%")
    end
  end

  context 'from implied probability' do
    it 'creates an odd from an implied probability string and returns an implied probability when asked for it' do
      new_odd = ROdds.create_odd('80%')

      implied_probability = new_odd.as_implied_probability

      expect(implied_probability.to_s).to eq("80.0%")
    end

    it 'creates an odd from a implied probability string and returns a decimal when asked for it' do
      new_odd = ROdds.create_odd('80%')

      implied_probability = new_odd.as_decimal

      expect(implied_probability.to_s).to eq("1.25")
    end
  end
end
