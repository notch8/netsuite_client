$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'active_support/core_ext'
require 'netsuite_client/soap_netsuite'
require 'netsuite_client/string'
require 'netsuite_client/netsuite_exception'
require 'netsuite_client/netsuite_result'
require 'netsuite_client/client'

class NetsuiteClient
  VERSION = '0.1.0'
end
