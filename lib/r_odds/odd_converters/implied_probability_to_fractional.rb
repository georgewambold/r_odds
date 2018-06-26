module ROdds
  module OddConverter
    class ROdds::OddConverter::ImpliedProbabilityToFractional

      def self.call(implied_probability)
        new(implied_probability).call
      end

      def initialize(implied_probability)
        @implied_probability = implied_probability
      end

      def call
        fractional_numerator   = (implied_probability.denominator - implied_probability.numerator)
        fractional_denominator = implied_probability.numerator

        ROdds::Odd::Fractional.new(numerator: fractional_numerator, denominator: fractional_denominator)
      end

      private
      attr_reader :implied_probability
    end
  end
end
