module GuidestarSearch
  class Query
    include HTTParty
    ssl_version :TLSv1

    attr_reader :parsed_response
    attr_reader :organizations

    def initialize(search_options)
      self.class.base_uri GuidestarSearch.configuration.sandbox? ?
        GuidestarSearch::Configuration::SANDBOX_ENDPOINT :
        GuidestarSearch::Configuration::ENDPOINT

      @options = {
        basic_auth: {
          username: GuidestarSearch.configuration.username,
          password: GuidestarSearch.configuration.password
        },
        query: {
          # convert the search_options hash into lucene query format
          q: search_options.map {|k, v| "#{k}:#{v}"}.join(' AND ')
        }
      }
    end

    def execute
      @response = self.class.get('/search.json', @options)
      @parsed_response = @response.parsed_response

      @organizations = if @parsed_response['hits']
        @parsed_response['hits'].map do |hit|
          Organization.new(hit)
        end
      else
        []
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