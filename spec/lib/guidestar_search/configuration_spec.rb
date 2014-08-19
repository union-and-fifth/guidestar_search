require_relative '../../spec_helper'

describe GuidestarSearch::Configuration do
  describe 'defaults and constants' do
    it 'has the correct default values for username, password, and sandbox' do
      config = GuidestarSearch::Configuration.new

      config.username.must_equal nil
      config.password.must_equal nil
      config.sandbox.must_equal false
    end

    it 'has the correct endpoint URL' do
      GuidestarSearch::Configuration::ENDPOINT.must_equal 'https://data.guidestar.org/v1'
    end

    it 'has the correct sandbox endpoint URL' do
      GuidestarSearch::Configuration::SANDBOX_ENDPOINT.must_equal 'https://sandboxdata.guidestar.org/v1'
    end
  end
end