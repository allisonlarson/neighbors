module NeighborhoodHelper
  def name_to_variable(name)
    clean_name = name.to_s.gsub(/\W+/, '')
    "marker#{clean_name}"
  end

end
