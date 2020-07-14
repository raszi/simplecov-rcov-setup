# Simplecov::Formatter::RcovFormatter::Setup

[![Build Status](https://travis-ci.org/raszi/simplecov-rcov-setup.svg?branch=master)](https://travis-ci.org/raszi/simplecov-rcov-setup)
[![Gem Version](https://badge.fury.io/rb/simplecov-rcov-setup.svg)](https://badge.fury.io/rb/simplecov-rcov-setup)

Helps you to set up the RcovFormatter easily

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simplecov-rcov-setup', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simplecov-rcov-setup

## Usage

Require it in your `spec/spec_helper.rb`:

```ruby
require 'simplecov-rcov-setup'
```

Then start it:

```ruby
SimpleCov::Formatter::RcovFormatter::Setup.unconditionally
```

If you want to turn on/off the coverage generation with the `COVERAGE`
environment variable then use the `#conditionally` method instead:

```ruby
require 'simplecov-rcov-setup'
SimpleCov::Formatter::RcovFormatter::Setup.conditionally
```

You can also configure it before starting:

```ruby
SimpleCov::Formatter::RcovFormatter::Setup.profile = 'rails'
SimpleCov::Formatter::RcovFormatter::Setup.formatters = SimpleCov::Formatter::RcovFormatter
```

even more complex setup is possible:

```ruby
SimpleCov::Formatter::RcovFormatter::Setup.profile = 'rails'
SimpleCov::Formatter::RcovFormatter::Setup.unconditionally do
  add_group 'Decorators', 'app/decorators'
end
```

## Contributing

1. Fork it ( https://github.com/raszi/simplecov-rcov-setup/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
