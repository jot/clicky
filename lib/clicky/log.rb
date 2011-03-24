require 'httparty'

module Clicky
  module Log
    include HTTParty
    
    base_uri Configuration.endpoint
    default_params {:site_id => Configuration.site_id,
                    :sitekey_admin => Configuration.sitekey_admin}
    
    def self.page_view(request)
      request(:page_view, request)
    end
    
    def self.outbound(request)
      request(:outbound, request)
    end
    
    def self.download(request)
      request(:download, request)
    end
    
    def self.click(request)
      request(:click, request)
    end
    
    def self.request(type, request)
      options = {:href => request.url, 
                  :type => type.to_s, 
                  :title => title(request.path_parameters),
                  :ua => request.env["HTTP_USER_AGENT"]}
      
      get("/", options)
    end
    
    def self.title(params)
      "%s/%s" % [params[:controller], params[:action]]
    end
    
  end
end