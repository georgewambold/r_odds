module ROdds
  module OddConverter
    class AmericanToImpliedProbability

      def self.call(american_odd)
        new(american_odd).call
      end

      def initialize(american_odd)
        @american_odd = american_odd
      end

      def call
        if american_odd.negative?
          derive_implied_probability_from_negative_american_odd
        else
          derive_implied_probability_from_positive_american_odd
        end
      end

      private
      attr_reader :american_odd

      def derive_implied_probability_from_negative_american_odd
        numerator   = american_odd.value.abs
        denominator = (american_odd.value.abs + 100)

        ROdds::Odd::ImpliedProbability.new(numerator: numerator, denominator: denominator)
      end

      def derive_implied_probability_from_positive_american_odd
        numerator   = 100
        denominator = (american_odd.value.abs + 100)

        ROdds::Odd::ImpliedProbability.new(numerator: numerator, denominator: denominator)
      end
    end
  end
end
