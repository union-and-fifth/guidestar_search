require_relative '../lib/guidestar_search'

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/guidestar_search_cassettes'
  c.stub_with :webmock
end