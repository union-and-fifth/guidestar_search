require_relative '../../spec_helper'

describe GuidestarSearch::Configuration do
  describe 'defaults and constants' do
    it 'has the correct default values for api key, username, password, and sandbox' do
      config = GuidestarSearch::Configuration.new

      config.api_key.must_equal nil
      config.username.must_equal nil
      config.password.must_equal nil
      config.sandbox.must_equal false
    end

    it 'has the correct search endpoint URL' do
      GuidestarSearch::Configuration::SEARCH_ENDPOINT.must_equal 'https://data.guidestar.org/v1'
    end

    it 'has the correct search sandbox endpoint URL' do
      GuidestarSearch::Configuration::SEARCH_SANDBOX_ENDPOINT.must_equal 'https://sandboxdata.guidestar.org/v1'
    end

    it 'has the correct detail endpoint URL' do
      GuidestarSearch::Configuration::DETAIL_ENDPOINT.must_equal 'https://data.guidestar.org/v1/detail'
    end

    it 'has the correct detail sandbox endpoint URL' do
      GuidestarSearch::Configuration::DETAIL_SANDBOX_ENDPOINT.must_equal 'https://sandboxdata.guidestar.org/v1/detail'
    end
  end
end