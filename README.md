# Installing r_odds

Add this line to your application's Gemfile:

```ruby
gem 'r_odds'
```
or
```
$ gem install r_odds
```
then
```
require 'r_odds'
```

## How to use the gem
Use the `:convert` method to convert between any of the following formats: `:american`, `:decimal`, `:fractional` or `:implied probability`

```ruby
ROdds.convert('+150', to: :decimal)
#=> 2.50
```

```ruby
ROdds.convert('25%', to: :american)
#=> +300
```
You can also specify the format you're passing in for ambiguous formats like `'1/2'` (which could be an implied probability or a fractional odd).

```ruby
ROdds.convert('1/4', to: :decimal)
#=> 1.25

ROdds.convert('1/4', from: :probability, to: :american)
#=> +300
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/georgewambold/r_odds. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ROdds project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/r_odds/blob/master/CODE_OF_CONDUCT.md).
