module Clicky
  module Configuration
    
    VALID_OPTIONS_KEYS = [:endpoint, 
                    :site_id, 
                    :sitekey_admin]

    attr_accessor *VALID_OPTIONS_KEYS
    
    def endpoint
      "http://in.getclicky.com/in.php"
    end
    
    def setup
      yield self
    end
  end
end