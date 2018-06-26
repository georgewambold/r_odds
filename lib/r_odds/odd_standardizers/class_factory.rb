module ROdds
  module OddStandardizer
    class ClassFactory

      def self.for(params)
        new(params).call
      end

      def initialize(params)
        @format = params[:format]
      end

      def call
        case format
        when :fractional
          ROdds::OddStandardizer::Fractional
        when :american
          ROdds::OddStandardizer::American
        when :implied_probability
          ROdds::OddStandardizer::ImpliedProbability
        when :decimal
          ROdds::OddStandardizer::Decimal
        else
          raise ArgumentError, "No implimented standardizer for odd format :#{format}"
        end
      end

      private
      attr_reader :format
    end
  end
end
