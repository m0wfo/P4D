module P4D
  class Quote
    attr_reader :quote_id, :expires, :delivery_country, :services
    
    def initialize(options={})
      @quote_id = options[:quote_id]
      @expires = options[:expires]
      @delivery_country = options[:country]
      @services = []
      add_services(options[:services])
    end
    
    private
    
    def add_services(*services)
      services.each do |s|
        @services << Service.new(quote_id,s)
      end
    end
  end
end