module ROdds
  module Odd
    class Fractional < ROdds::Odd::Base
      attr_reader :numerator, :denominator

      def initialize(numerator:, denominator:)
        @numerator   = numerator
        @denominator = denominator
        @fraction    = Rational(numerator, denominator)
      end

      def format
        :fractional
      end

      def to_s
        fraction.to_s
      end

      private
      attr_reader :fraction
    end
  end
end
