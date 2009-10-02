module P4D
  module Callable
    def make_callable(input)
      struct_params = {}
      input.each do |k,v|
        struct_params = struct_params.merge(k.decamelize => classify(v))
      end
      return OpenStruct.new(struct_params)
    end

    def classify(input)
      case input
      when /^[YN]$/ # If we have a boolean
        # warn "#{input} is a bool"
        return {"Y" => true, "N" => false}[input]
      when /\d+\.\d+/ # If we have a float
        # warn "#{input} is a float"
        return input.to_f
      when /\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}/ # If we have a date
        # warn "#{input} is a date"
        return Time.parse(input)
      when /^\d+$/ # If we have an int
        # warn "#{input} is an int"
        return input.to_i
      else # Otherwise treat it as a string
        # warn "#{input} is a whatever"
        return input
      end
    end
  end
end