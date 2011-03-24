require 'httparty'

module Clicky
  class Client
    include HTTParty
    
    base_uri Clicky.endpoint
    default_params :site_id => Clicky.site_id, :sitekey_admin => Clicky.sitekey_admin
    
    def initialize(options={})
      self.class.default_params(options)
    end
    
    def page_view(request)
      request(:page_view, request)
    end
    
    def outbound(request)
      request(:outbound, request)
    end
    
    def download(request)
      request(:download, request)
    end
    
    def click(request)
      request(:click, request)
    end
    
    def request(type, request)
      options = {:href => request.url, 
                  :type => type.to_s, 
                  :title => title(request.path_parameters),
                  :ua => request.env["HTTP_USER_AGENT"]}
      
      self.class.get("/", options)
    end
    
    def title(params)
      "%s/%s" % [params[:controller], params[:action]]
    end
    
  end
end