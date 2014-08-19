module GuidestarSearch
  class Configuration
    ENDPOINT = 'https://data.guidestar.org/v1'
    SANDBOX_ENDPOINT = 'https://sandboxdata.guidestar.org/v1'

    attr_accessor :username
    attr_accessor :password
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