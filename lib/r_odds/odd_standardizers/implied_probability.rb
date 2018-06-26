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
        float_odd = odd.to_f.rationalize

        ROdds::Odd::ImpliedProbability.new(numerator: float_odd, denominator: 100)
      end

      private
      attr_reader :odd
    end
  end
end
