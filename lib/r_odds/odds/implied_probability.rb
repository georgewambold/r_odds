module ROdds
  module Odd
    class ImpliedProbability < ROdds::Odd::Base
      FIFTY_PERCENT_AS_A_DECIMAL = 0.5
      attr_reader :numerator, :denominator, :fraction

      def initialize(numerator:, denominator:)
        @numerator   = numerator
        @denominator = denominator
        @fraction    = Rational(numerator, denominator)
      end

      def to_s(round_to: 2)
        fraction_to_percentage.round(round_to).to_s + "%"
      end

      def format
        :implied_probability
      end

      def greater_than_50_percent?
        fraction.to_f > FIFTY_PERCENT_AS_A_DECIMAL
      end

      private

      def fraction_to_percentage
        fraction.to_f * 100.to_f
      end
    end
  end
end
