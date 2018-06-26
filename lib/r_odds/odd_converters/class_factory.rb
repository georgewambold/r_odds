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
        derived_class = derive_conversion_class

        if derived_class.nil?
          raise ArgumentError, "No known conversion class to get from format :#{from}, to format :#{to}"
        else
          derived_class
        end
      end

      private
      attr_reader :from, :to

      def derive_conversion_class
        case to
        when :implied_probability
          case from
          when :fractional
            ROdds::OddConverter::FractionalToImpliedProbability
          when :american
            ROdds::OddConverter::AmericanToImpliedProbability
          when :implied_probability
            ROdds::OddConverter::ImpliedProbabilityToImpliedProbability
          when :decimal
            ROdds::OddConverter::DecimalToImpliedProbability
          end
        end
      end
    end
  end
end
