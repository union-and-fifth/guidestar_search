require_relative '../../spec_helper'

describe GuidestarSearch do
  describe '#configure' do
    after do
      GuidestarSearch.reset_configuration
    end

    it 'allows users to set the API username' do
      GuidestarSearch.configure do |config|
        config.username = 'afake@email.com'
      end

      GuidestarSearch.configuration.username.must_equal 'afake@email.com'
    end

    it 'allows users to set the API password' do
      GuidestarSearch.configure do |config|
        config.password = 'notARealPassword'
      end

      GuidestarSearch.configuration.password.must_equal 'notARealPassword'
    end

    it 'allows users to set the API sandbox mode' do
      GuidestarSearch.configure do |config|
        config.sandbox = true
      end

      GuidestarSearch.configuration.sandbox.must_equal true
    end
  end
end