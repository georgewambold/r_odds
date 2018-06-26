module ROdds
  module OddStandardizer
    class ImpliedProbability

      def self.call(params)
        new(params).call
      end

      def initialize(params)
        @odd = params[:odd]
      end

      def call
        if odd_is_a_probability_fraction
          rational_odd = odd.to_r

          ROdds::Odd::ImpliedProbability.new(
            numerator: rational_odd.numerator,
            denominator: rational_odd.denominator
          )
        elsif odd_is_a_percentage
          rational_odd = odd.to_r

          ROdds::Odd::ImpliedProbability.new(
            numerator: rational_odd,
            denominator: Rational(100)
          )
        end
      end

      private
      attr_reader :odd

      def odd_is_a_probability_fraction
        /\d+\/\d+/.match?(odd)
      end

      def odd_is_a_percentage
        /\d*.?\d++%/.match?(odd)
      end
    end
  end
end
