module ROdds
  module OddStandardizer
    class Fractional
      NUMERATOR_AND_DENOMINATOR = /(?<numerator>\d+)(\/|-to-| to |to|)(?<denominator>\d+)/

      def self.call(params)
        new(params).call
      end

      def initialize(params)
        @raw_odd = params[:odd]
      end

      def call
        fraction = NUMERATOR_AND_DENOMINATOR.match(raw_odd)

        reduced_fraction = reduce(fraction)

        ROdds::Odd::Fractional.new(
          numerator: reduced_fraction.numerator,
          denominator: reduced_fraction.denominator
        )
      end

      private
      attr_reader :raw_odd

      def reduce(fraction)
        Rational(fraction[:numerator], fraction[:denominator])
      end
    end
  end
end
