module ROdds
  module Odd
    class Standardizer

      def self.call(params)
        new(params).call
      end

      def initialize(params)
        @raw_odd    = params[:odd]
        @odd_format = ROdds::InferOddFormat.of(odd: raw_odd)
      end

      def call
        standardizer_class = ROdds::OddStandardizer::ClassFactory.for(format: odd_format)

        standardizer_class.call(odd: raw_odd)
      end

      private
      attr_reader :raw_odd, :odd_format
    end
  end
end
