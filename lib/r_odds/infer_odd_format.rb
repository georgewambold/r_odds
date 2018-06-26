module ROdds
  class InferOddFormat

    def self.of(params)
      new(params).call
    end

    def initialize(params)
      @odd = params[:odd]
    end

    def call
      case odd
      when /^(?:[1-9]\d*)+(\/|:)(?:[1-9]\d*)+$/
        :fractional
      when /^[+-][1-9]\d{2,}\.?\d*$/
        :american
      when /\d*.?\d++%/
        :implied_probability
      when /^[1-9]\d*(\.\d+)$/
        :decimal
      else
        raise ArgumentError, "Odd given in unknown format. See docs for acceptable formats"
      end
    end

    private
    attr_reader :odd
  end
end
