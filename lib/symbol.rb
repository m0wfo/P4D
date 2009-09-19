# Formatting methods for changing a ruby hash key to and from a camelized API argument
class Symbol
  # Converts a hash key (e.g. from the list of supplied arguments on request initialization) to
  # camel-cased strings
  def camelize
    self.to_s.split('_').map {|w| w.capitalize}.join
  end
end