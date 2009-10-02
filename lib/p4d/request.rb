module P4D
  class Request
    include Callable

    STANDARD_RESPONSE_KEYS = ['ShipAction', 'Status', 'RequestDate', 'Username']

    attr_reader :headers, :body

    def initialize(connection)
      raise "A connection object is required" unless connection.is_a?(Connection)
      @connection = connection
    end

    def call(action, params={})
      @action = action.to_s.camelize
      @params = format_options(params)
      raw_hash = process(HTTParty.post(@connection.endpoint + @params))
      @headers = make_callable(raw_hash.select { |k,v| STANDARD_RESPONSE_KEYS.include?(k) })
      @body = make_callable(raw_hash.delete_if { |k,v| STANDARD_RESPONSE_KEYS.include?(k) })
    end

    def format_options(opts)
      hsh = {}
      opts.map { |k,v| hsh = hsh.merge({k.to_s.camelize => v}) }
      merged = (hsh.empty? ? {} : hsh).merge(connection_hash)
      urlencode(merged)
    end

    def urlencode(data)
      '?' + data.map { |k,v| "#{k}=#{CGI.escape(v)}&" }.join.to_s.chomp('&')
    end

    def connection_hash
      {"Username" => @connection.username, "APIKey" => @connection.api_key, "ShipAction" => @action}
    end

    def process(response)
      PHP.unserialize(response)
    end
  end
end