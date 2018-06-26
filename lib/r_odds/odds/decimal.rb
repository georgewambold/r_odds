module ROdds
  module Odd
    class Decimal < ROdds::Odd::Base

      def initialize(value:)
        if value.kind_of? Rational
          @value = value
        else
          raise ArgumentError, "Decimal odds must be initialized a Rational instance. Given a #{value.class} instance instead"
        end
      end

      def format
        :decimal
      end

      def to_s(round_to: 2)
        "%.#{round_to}f" % value
      end

      def as_rational
        value.rationalize
      end

      private
      attr_reader :value
    end
  end
end

