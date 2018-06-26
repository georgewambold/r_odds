module ROdds
  class ConvertOdd
    DEFAULT_FORMAT = :implied_probability

    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @raw_odd = params[:raw_odd]
      @from    = params[:from] || infered_format
      @to      = params[:to]
    end

    def call
      standardized_odd = ROdds::Odd::Standardizer.call(odd: raw_odd, format: from)

      implied_probability = default_conversion_class.call(standardized_odd)

      converted_odd = final_conversion_class.call(implied_probability)

      converted_odd.to_s
    end

    private
    attr_reader :raw_odd, :from, :to

    def infered_format
      ROdds::InferOddFormat.of(odd: raw_odd)
    end

    def default_conversion_class
      ROdds::OddConverter::ClassFactory.call(from: from, to: DEFAULT_FORMAT)
    end

    def final_conversion_class
      ROdds::OddConverter::ClassFactory.call(from: DEFAULT_FORMAT, to: to)
    end
  end
end
