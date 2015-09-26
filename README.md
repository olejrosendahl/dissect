[travis]: https://travis-ci.org/blacktangent/dissect

# Dissect

[![Build Status](https://travis-ci.org/blacktangent/dissect.svg?branch=master)][travis]

Problem: Known Gems have has good or bad documentation, examples or
Wikies, but what often lacks is examples of the features used in the wild.

Solution: Find Open Source projects for the Gems to see how the
libraries API's are being used in the wild to find good examples.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dissect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dissect

## API

	# search organization for given gem name
	code_search(gem_name, organization, options = {})

## Usage

	dissect = Dissect::Client.new
	findings = dissect.code_search("rails", "thoughtbot", "ruby")
	findings.each do |f|
    puts f.name
    puts f.path
    puts f.html_url
    puts f.repository_name
	end

## Development
 
After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/olejrosendahl/dissect. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

