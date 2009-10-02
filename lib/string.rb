# Formatting methods for changing a ruby hash key to and from a camelized API argument
class String
  # Converts a hash key (e.g. from the list of supplied arguments on request initialization) to
  # camel-cased strings
  def camelize
    self.to_s.split('_').map {|w| w.capitalize}.join
  end
  
  # Taken straight from Rails' ActiveSupport::Inflector#underscore method
  def decamelize
    self.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').gsub(/([a-z\d])([A-Z])/,'\1_\2').tr("-", "_").downcase
  end
end