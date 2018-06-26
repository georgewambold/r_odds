require 'spec_helper'

describe ROdds::OddStandardizer::Decimal do
   it 'standardizes a basic decimal string' do
     raw_odd = '1.25'

     decimal_odd = ROdds::OddStandardizer::Decimal.call(odd: raw_odd)

     expect(decimal_odd.to_s).to eq('1.25')
   end

   it 'standardizes another decimal string' do
     raw_odd = '100.254'

     decimal_odd = ROdds::OddStandardizer::Decimal.call(odd: raw_odd)

     expect(decimal_odd.to_s(round_to: 3)).to eq('100.254')
   end
end
