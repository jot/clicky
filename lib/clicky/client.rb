require 'httparty'

module Clicky
  class Client
    include HTTParty
    
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    def initialize(options={})
      options = Clicky.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
      
      self.class.base_uri self.endpoint
      self.class.default_params :site_id => self.site_id, :sitekey_admin => self.sitekey_admin
    end
    
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