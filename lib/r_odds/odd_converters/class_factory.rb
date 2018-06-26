module ROdds
  module OddConverter
    class ClassFactory
      def self.call(params)
        new(params).call
      end

      def initialize(params)
        @from = params[:from]
        @to   = params[:to]
      end

      def call
        begin
          Object.const_get("ROdds::OddConverter::#{capitalize(from)}To#{capitalize(to)}")
        rescue NameError
          raise ArgumentError,
            "No known conversion class to get from format :#{from}, to format :#{to}"
        end
      end

      private
      attr_reader :from, :to

      def capitalize(symbol)
        symbol.to_s.split('_').map(&:capitalize).join
      end
    end
  end
end
