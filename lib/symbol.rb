class Symbol
  def camelize
    self.to_s.split('_').map {|w| w.capitalize}.join
  end
end