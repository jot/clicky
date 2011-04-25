require 'httparty'

module Clicky
  class Client
    include HTTParty
    
    attr_accessor *Configuration::VALID_OPTIONS_KEYS
    
    def initialize(options={})
      self.class.base_uri(Clicky.endpoint)
            
      site_keys = {:site_id => Clicky.site_id, :sitekey_admin => Clicky.sitekey_admin}
      options = site_keys.merge(options)
      
      self.class.default_params(options)
      
      options.merge!({:endpoint => Clicky.endpoint})
      
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
    
    def page_view(request=nil, options={})
      request(:page_view, request, options)
    end
    
    def outbound(request=nil, options={})
      request(:outbound, request, options)
    end
    
    def download(request=nil, options={})
      request(:download, request, options)
    end
    
    def click(request=nil, options={})
      request(:click, request, options)
    end
    
    def goal(goal_id, request=nil, options={})
      request(:goal, request, options.merge({:goal => {:id => goal_id}}))
    end
    
    def request(type, request=nil, options={})
      request_options = {}
      if request
        request_options = {:href => request.url, 
                            :title => title(request.path_parameters),
                            :ua => request.env["HTTP_USER_AGENT"],
                            :ip_address => request.remote_ip,
                            :session_id => request.session_options[:id]}
      end
      
      options = request_options.merge!(options)
      options.merge!(:type => type.to_s)
      
      self.class.get("", :query => options)
    end
    
    def title(params)
      "%s/%s" % [params[:controller], params[:action]]
    end
    
  end
end