module ROdds
  module OddConverter
    class ImpliedProbabilityToDecimal

      def self.call(implied_probability)
        new(implied_probability).call
      end

      def initialize(implied_probability)
        @implied_probability = implied_probability
      end

      def call
        value = (1 / implied_probability.fraction)

        ROdds::Odd::Decimal.new(value: value)
      end

      private
      attr_reader :implied_probability
    end
  end
end
