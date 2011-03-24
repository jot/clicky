module Clicky
  module Configuration
    
    DEFAULT_ENDPOINT = "http://in.getclicky.com/in.php"
    
    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end
    
    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end
    
    # Reset all configuration options to defaults
    def reset
      self.endpoint           = DEFAULT_ENDPOINT
      self.site_id            = nil
      self.sitekey_admin      = nil
      self
    end
  end
end