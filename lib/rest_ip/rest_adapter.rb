module RestIP
  module RestAdapter
    def rest_adapter
      @@rest_adapter
    end

    def rest_adapter=(name_or_adapter)
      @@rest_adapter =
        case name_or_adapter
        when String, Symbol
          load_adapter name_or_adapter
        when Class
          name_or_adapter
        end
    end

    private

    def load_adapter(name)
      require "rest_ip/rest_adapters/#{name}_adapter"
      Object.const_get "RestIP::RestAdapters::#{name.to_s.capitalize}Adapter"
    end
  end
end
