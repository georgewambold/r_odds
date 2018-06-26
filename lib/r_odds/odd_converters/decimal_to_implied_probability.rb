module ROdds
  module OddConverter
    class DecimalToImpliedProbability

      def self.call(decimal_odd)
        new(decimal_odd).call
      end

      def initialize(decimal_odd)
        @decimal_odd = decimal_odd
      end

      def call
        rational = 1 / decimal_odd.as_rational

        ROdds::Odd::ImpliedProbability.new(
          numerator: rational.numerator,
          denominator: rational.denominator
        )
      end

      private
      attr_reader :decimal_odd
    end
  end
end
