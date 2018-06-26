require "r_odds/version"
require 'r_odds/create_odd'
require 'r_odds/convert_odd'
require 'r_odds/infer_odd_format'
require 'r_odds/odd_converters/american_to_implied_probability'
require 'r_odds/odd_converters/class_factory'
require 'r_odds/odd_converters/decimal_to_implied_probability'
require 'r_odds/odd_converters/fractional_to_implied_probability'
require 'r_odds/odd_converters/implied_probability_to_american'
require 'r_odds/odd_converters/implied_probability_to_decimal'
require 'r_odds/odd_converters/implied_probability_to_fractional'
require 'r_odds/odd_converters/implied_probability_to_implied_probability'
require 'r_odds/odd_standardizers/american'
require 'r_odds/odd_standardizers/class_factory'
require 'r_odds/odd_standardizers/decimal'
require 'r_odds/odd_standardizers/fractional'
require 'r_odds/odd_standardizers/implied_probability'
require 'r_odds/odds/base'
require 'r_odds/odds/american'
require 'r_odds/odds/decimal'
require 'r_odds/odds/fractional'
require 'r_odds/odds/implied_probability'
require 'r_odds/standardizer'
require 'r_odds/generic_odd'

module ROdds
  def self.create_odd(value)
    ROdds::CreateOdd.call(value)
  end

  def self.convert(odd, from: nil, to:)
    ROdds::ConvertOdd.call(raw_odd: odd, from: from, to: to)
  end
end
