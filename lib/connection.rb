# Connection object for AbstractRequest objects to bind to.
class Connection
  attr_reader :username, :api_key, :endpoint
  
  ENDPOINT = 'https://www.p4d.co.uk/p4d/api/phpsystem'
  
  # Create a new connection object. :username, :key and :endpoint can be optionally specified.
  #
  # A connection object instantiated without any options uses the test credentials.
  def initialize(options={})
    @username = options[:username]  || 'testuser'
    @api_key =  options[:key]       || 'FI71OLRJB7LYC7BDRR0'
    @endpoint = options[:endpoint]  || ENDPOINT
  end
  
end