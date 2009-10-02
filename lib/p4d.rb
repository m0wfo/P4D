$:.unshift File.dirname(__FILE__)
%w(httparty cgi php_serialize ostruct).each { |external| require external }
%w(string callable connection request api).each { |f| require File.join(File.dirname(__FILE__), 'p4d', f) }

module P4D
  VERSION = '0.0.1'
end