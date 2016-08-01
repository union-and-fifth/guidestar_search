module GuidestarSearch
  class Detail
    include HTTParty
    ssl_version :TLSv1

    attr_reader :parsed_response
    attr_reader :organization

    def initialize(organization_id)
      self.class.base_uri get_base_uri

      @options = {
        basic_auth: {
          username: GuidestarSearch.configuration.api_key,
          password: ''
        }
      }
      @organization_id = organization_id.to_i
    end

    def execute
      @response = self.class.get('/' + @organization_id.to_s, @options)
      @parsed_response = @response.parsed_response

      @organization = if @parsed_response['ein']
        Organization.new(@parsed_response)
      else
        {}
      end
    end

    def get_base_uri
      if GuidestarSearch.configuration.sandbox?
        GuidestarSearch::Configuration::DETAIL_SANDBOX_ENDPOINT
      else
        GuidestarSearch::Configuration::DETAIL_ENDPOINT
      end
    end

    def method_missing(name, *args, &block)
      if @parsed_response.has_key?(name.to_s)
        @parsed_response[name.to_s]
      else
        super
      end
    end
  end
end