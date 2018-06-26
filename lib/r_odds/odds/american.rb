module ROdds
  module Odd
    class American < ROdds::Odd::Base
      attr_reader :value

      def initialize(value:)
        if value.kind_of? Rational
          @value = value
        else
          raise ArgumentError, "ROdds::Odd::American must be initialized with a Rational value. Given a #{value.class} instance"
        end
      end

      def format
        :american
      end

      def to_s
        "%+d" % value
      end

      def negative?
        value.negative?
      end
    end
  end
end
