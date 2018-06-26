module ROdds
  module OddStandardizer
    class Decimal

      def self.call(params)
        new(params).call
      end

      def initialize(params)
        @odd = params[:odd]
      end

      def call
        value = Rational(odd)

        ROdds::Odd::Decimal.new(value: value)
      end

      private
      attr_reader :odd
    end
  end
end
