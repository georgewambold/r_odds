module ROdds
  class GenericOdd

    def initialize(implied_probability:)
      @implied_probability = implied_probability
    end

    def as_implied_probability
      @as_implied_probability ||= implied_probability
    end

    def as_fractional
      @as_fractional ||= ROdds::OddConverter::ImpliedProbabilityToFractional.call(implied_probability)
    end

    def as_american
      @as_american ||= ROdds::OddConverter::ImpliedProbabilityToAmerican.call(implied_probability)
    end

    def as_decimal
      @as_decimal ||= ROdds::OddConverter::ImpliedProbabilityToDecimal.call(implied_probability)
    end

    def rational_implied_probability
      as_implied_probability.fraction
    end

    private
    attr_reader :implied_probability
  end
end
