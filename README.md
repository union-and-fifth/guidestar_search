# GuidestarSearch

A simple wrapper for the https://data.guidestar.org/ API.

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

To retrieve a specific page number of the results, pass in the optional extra param `page` like this:

``` ruby
GuidestarSearch.query(city: 'Santa Cruz', state: 'CA', page: 3)
```

To retrieve a specific number of results per page, pass in the optional extra param `per_page` like this:

``` ruby
GuidestarSearch.query(city: 'Santa Cruz', state: 'CA', per_page: 25)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
