module ROdds
  module OddConverter
    class ImpliedProbabilityToImpliedProbability

      def self.call(implied_probability)
        new(implied_probability).call
      end

      def initialize(implied_probability)
        @implied_probability = implied_probability
      end

      def call
        implied_probability
      end

      private
      attr_reader :implied_probability
    end
  end
end
