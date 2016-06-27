require 'httparty'

require_relative './guidestar_search/version'
require_relative './guidestar_search/configuration'
require_relative './guidestar_search/query'
require_relative './guidestar_search/detail'
require_relative './guidestar_search/organization'

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

    def detail(organization_id)
      detail = Detail.new(organization_id)

      detail.execute

      return detail
    end
  end
end
