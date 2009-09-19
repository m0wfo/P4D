# The base class from which all requests inherit.
class AbstractRequest
  def self.action=(name)
    @@action = name
  end
  
  # Expects a Connection object plus an optional parameters hash
  def initialize(connection, params={})
    @connection = connection
    @params = format_options(params)
  end
  
  # Send the request to the web service. Returns a <i>@response</i> hash for descendent classes to
  # use in their utility methods.
  def call
    @response ||= process(HTTParty.post(@connection.endpoint + @params))
  end
  
  private
  
  def format_options(opts)
    hsh = {}
    opts.map { |k,v| hsh = hsh.merge({k.camelize => v}) }
    merged = (hsh.empty? ? {} : hsh).merge(connection_hash)
    urlencode(merged)
  end
  
  def urlencode(data)
    '?' + data.map { |k,v| "#{k}=#{CGI.escape(v)}&" }.join.to_s.chomp('&')
  end
   
  def connection_hash
    {"Username" => @connection.username, "APIKey" => @connection.api_key, "ShipAction" => @@action}
  end
  
  def process(response)
    PHP.unserialize(response)
  end
end