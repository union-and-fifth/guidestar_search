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

### Search

Pass accepted `q` params into the query method, as defined here: https://data.guidestar.org/#guidestar_search

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

The query method above returns a query object, with two methods on it:

``` ruby
organizations
total_num_organizations
```

total_num_organizations contains the total number of results across all pages.  organizations returns a list of simple result objects, on which you can call methods named the same as the field names from the GuideStar Search API.  Some common field names are:

``` ruby
organization_id
ein
organization_name
city
state
zip
mission
website
```

### Detail

Pass a GuideStar organization id into the detail method to get details on that organization.

``` ruby
GuidestarSearch.detail(8867641)
```

The detail method above returns a simple result object, on which you can call methods named the same as the field names from the GuideStar Detail API.  Some common field names are:

``` ruby
organization_id
ein
organization_name
address_line1
address_line2
city
state
zip
zip4
contact_phone
contact_fax
mission
year_founded
website
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
