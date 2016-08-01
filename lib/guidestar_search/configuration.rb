module GuidestarSearch
  class Configuration

    SEARCH_ENDPOINT = 'https://data.guidestar.org/v1_1'
    SEARCH_SANDBOX_ENDPOINT = 'https://sandboxdata.guidestar.org/v1_1'

    DETAIL_ENDPOINT = 'https://data.guidestar.org/v1/detail'
    DETAIL_SANDBOX_ENDPOINT = 'https://sandboxdata.guidestar.org/v1/detail'

    attr_accessor :api_key
    attr_accessor :sandbox

    def sandbox?
      @sandbox
    end

  private
    def initialize
      @sandbox = false
    end
  end
end