# GuidestarSearch

A simple wrapper for the https://data.guidestar.org/ API. Still pretty WIP at the moment, no real error handling or result paging yet. We'll get there.

## Installation

Add this line to your application's Gemfile:

    gem 'guidestar_search'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guidestar_search

## Usage

### Configure

Pretty straightforward. If you're testing, you can set `sandbox` to true to hit the sandbox endpoint.

``` ruby
GuidestarSearch.configure do |config|
  config.username = 'your.guidestar@account.com'
  config.password = 'yourGuidestarPassword'
  config.sandbox = true
end
```

### Query

Pass in accepted `q` params, as defined here: https://data.guidestar.org/#guidestar_search

``` ruby
GuidestarSearch.query(city: 'Santa Cruz', state: 'CA')
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
