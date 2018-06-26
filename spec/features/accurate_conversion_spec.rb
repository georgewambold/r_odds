require 'spec_helper'

describe 'generic odd conversion' do
  odds_conversion_table = [
    { implied_probability: '80.0%', fractional: '1/4', decimal: '1.25',  american: '-400'},
    { implied_probability: '50.0%', fractional: '1/1', decimal: '2.00',  american: '+100'},
    { implied_probability: '40.0%', fractional: '3/2', decimal: '2.50',  american: '+150'},
    { implied_probability: '25.0%', fractional: '3/1', decimal: '4.00',  american: '+300'},
    { implied_probability: '10.0%', fractional: '9/1', decimal: '10.00', american: '+900'},
  ]

  odds_conversion_table.each do |equivalent_odds|
    equivalent_odds.each do |odd_type, odd|
      equivalent_odds.each do |type_to_check, odd_to_check|
        it "converts #{odd} (#{odd_type}) to => #{odd_to_check} (#{type_to_check})" do
          expect(ROdds.convert(odd, to: type_to_check)).to eq(equivalent_odds[type_to_check])
        end
      end
    end
  end
end
