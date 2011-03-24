require 'active_support/core_ext'
require 'clicky/client'

module Clicky
  extend Configuration
  
  def self.endpoint
    "http://in.getclicky.com/in.php"
  end
  
end
