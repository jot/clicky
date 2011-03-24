require 'active_support/core_ext'
require 'clicky/client'

module Clicky
  
  mattr_accessor :endpoint
  @@endpoint = "http://in.getclicky.com/in.php"
  
  mattr_accessor :site_id
  @@site_id = nil
  
  mattr_accessor :sitekey_admin
  @@sitekey_admin = nil
  
  def self.setup
    yield self
  end
  
end
