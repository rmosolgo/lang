module DataValue

  def data_value_lists
    hms = self.class.reflect_on_all_associations(:has_many)
    habtms = self.class.reflect_on_all_associations(:has_and_belongs_to_many)
    (hms + habtms).map {|as| as.name}
  end

end
