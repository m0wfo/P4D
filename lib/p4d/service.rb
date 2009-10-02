module P4D
  class Service
    OPTIONS = [:option_id, :carrier, :service_name, :service_id, :subject_to_vat, :sub_total, :vat_total, :total_price]

    attr_reader *(OPTIONS | [:quote_id])
    
    def initialize(quote_id,details)
      @quote_id = quote_id
      # warn details.inspect
      details.each do |detail|
        OPTIONS.each do |option|
          instance_variable_set("@#{option}".to_sym, detail.send(option))
        end
      end
    end
  end
end