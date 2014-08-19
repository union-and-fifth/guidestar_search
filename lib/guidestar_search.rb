require 'httparty'

require 'guidestar_search/version'
require 'guidestar_search/configuration'
require 'guidestar_search/query'
require 'guidestar_search/organization'

module GuidestarSearch
  class << self
    attr_reader :configuration

    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def reset_configuration
      @configuration = Configuration.new
    end

    def query(opts = {})
      query = Query.new(opts)

      query.execute

      return query
    end
  end
end
