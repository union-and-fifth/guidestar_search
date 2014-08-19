module GuidestarSearch
  class Organization
    def initialize(raw_info)
      @raw_info = raw_info
    end

    def method_missing(name, *args, &block)
      if @raw_info.has_key?(name.to_s)
        @raw_info[name.to_s]
      else
        super
      end
    end
  end
end