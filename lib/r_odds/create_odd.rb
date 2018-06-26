module ROdds
  class CreateOdd
    DEFAULT_FORMAT = :implied_probability

    def self.call(value)
      new(value: value).call
    end

    def initialize(params)
      @value = params[:value]
    end

    def call
      standardized_odd = ROdds::Odd::Standardizer.call(odd: value)

      conversion_class = ROdds::OddConverter::ClassFactory.call(from: standardized_odd.format, to: DEFAULT_FORMAT)

      implied_probability = conversion_class.call(standardized_odd)

      ROdds::GenericOdd.new(implied_probability: implied_probability)
    end

    private
    attr_reader :value, :inferred_format
  end
end
