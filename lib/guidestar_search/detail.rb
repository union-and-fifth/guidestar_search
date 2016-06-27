module GuidestarSearch
  class Detail
    include HTTParty
    ssl_version :TLSv1

    attr_reader :parsed_response
    attr_reader :organization

    def initialize(organization_id)
      self.class.base_uri GuidestarSearch.configuration.sandbox? ?
        GuidestarSearch::Configuration::DETAIL_SANDBOX_ENDPOINT :
        GuidestarSearch::Configuration::DETAIL_ENDPOINT

      @options = {
        basic_auth: {
          username: GuidestarSearch.configuration.username,
          password: GuidestarSearch.configuration.password
        }
      }
      @organization_id = organization_id
    end

    def execute
      @response = self.class.get('/' + @organization_id, @options)
      @parsed_response = @response.parsed_response

      @organization = if @parsed_response.present?
        Organization.new(@parsed_response)
      else
        {}
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