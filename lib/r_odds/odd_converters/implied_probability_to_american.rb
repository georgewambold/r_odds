module ROdds
  module OddConverter
    class ImpliedProbabilityToAmerican

      def self.call(implied_probability)
        new(implied_probability).call
      end

      def initialize(implied_probability)
        @implied_probability = implied_probability
      end

      def call
        if implied_probability.greater_than_50_percent?
          convert_to_negative_american_odd
        else
          convert_to_positive_american_odd
        end
      end

      private
      attr_reader :implied_probability

      def convert_to_negative_american_odd
        value = (100 * implied_probability.fraction) / (1 - implied_probability.fraction)

        ROdds::Odd::American.new(value: -value)
      end

      def convert_to_positive_american_odd
        value = ((100 * implied_probability.fraction) - 100) / -(implied_probability.fraction)

        ROdds::Odd::American.new(value: value)
      end
    end
  end
end
