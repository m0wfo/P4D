module P4D
  class API
    class << self
      include Callable
      
      def get_balance
        r = Request.new(@@c).call(:get_balance)
        r.balance
      end
      
      def get_countries
        r = Request.new(@@c).call(:get_countries)
        r.countries
      end
      
      def get_insurance(code=nil)
        if code
          r = Request.new(@@c).call(:get_insurance, {:insurance_code => code})
          make_callable(r.insurance_info.first)
        else
          r = Request.new(@@c).call(:get_insurance)
          options = []
          r.insurance_info.each do |i|
            options << make_callable(i)
          end
          options
        end
      end
      
      def service_info(service=nil)
        if service
          r = Request.new(@@c).call(:service_info, {:service_id => service})
          make_callable(r.service_info.first[1])
        else
          r = Request.new(@@c).call(:service_info)
          r.service_info
        end
      end
      
      def get_quote(options={})
        r = Request.new(@@c).call(:get_quote, options)

        services = []
        r.service_options.each do |id, details|
          services << make_callable(r.service_options[id])
        end
        Quote.new(:quote_id => r.quote_id, :expires => r.quote_expires, :country => r.delivery_country, :services => services)
      end
      
      private
      
      def singleton_method_added(id)
        @@c ||= Connection.new
      end
    end
  end
end