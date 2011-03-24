module Clicky
  module Configuration
    
    attr_accessor :endpoint, :site_id, :sitekey_admin

    def setup
      yield self
    end
  end
end