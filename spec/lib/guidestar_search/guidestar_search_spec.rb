require_relative '../../spec_helper'

describe GuidestarSearch do
  describe '#configure' do
    after do
      GuidestarSearch.reset_configuration
    end

    it 'allows users to set the API key' do
      GuidestarSearch.configure do |config|
        config.api_key = 'notARealAPIKey'
      end

      GuidestarSearch.configuration.api_key.must_equal 'notARealAPIKey'
    end

    it 'allows users to set the API sandbox mode' do
      GuidestarSearch.configure do |config|
        config.sandbox = true
      end

      GuidestarSearch.configuration.sandbox.must_equal true
    end
  end
end