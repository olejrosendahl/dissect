[travis]: https://travis-ci.org/olejrosendahl/dissect
[codeclimate]: https://codeclimate.com/github/olejrosendahl/dissect
[coveralls]: https://coveralls.io/r/olejrosendahl/dissect
[rubygems]: https://rubygems.org/gems/dissect

# Dissect

[![Build Status](https://travis-ci.org/olejrosendahl/dissect.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/olejrosendahl/dissect/badges/gpa.svg)][codeclimate]
[![Test Coverage](http://img.shields.io/coveralls/olejrosendahl/dissect/master.svg)][coveralls]
[![Gem Version](http://img.shields.io/gem/v/dissect.svg)][rubygems]

*EXPERIMENTAL*

Problem: Libraries are often well documented, but what often lacks to
get started is to see examples of their features used in the wild.

Solution: Find Open Source projects on Github where the libraries are
used. Learn their API's and see how other programmers use them and
explore possibilities.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dissect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dissect

## Usage

```ruby
dissect = Dissect::Finders::GemFinder.new
findings = dissect.find("thoughtbot", "devise")
findings.each do |f|
  puts f.name
  puts f.path
  puts f.html_url
  puts f.repository_name
  puts f.to_json
end
```

## Development
 
After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/olejrosendahl/dissect. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

