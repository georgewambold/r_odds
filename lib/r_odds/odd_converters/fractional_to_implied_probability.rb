module ROdds
  module OddConverter
    class FractionalToImpliedProbability

      def self.call(fractional_odd)
        new(fractional_odd).call
      end

      def initialize(fractional_odd)
        @fractional_odd = fractional_odd
      end

      def call
        numerator_for_implied_prob   = fractional_odd.denominator
        denominator_for_implied_prob = fractional_odd.denominator + fractional_odd.numerator

        ROdds::Odd::ImpliedProbability.new(
          numerator: numerator_for_implied_prob,
          denominator: denominator_for_implied_prob
        )
      end

      private
      attr_reader :fractional_odd
    end
  end
end
