class Coordinates < ActiveRecord::Base
  belongs_to :locatable, polymorphic: true
  set_rgeo_factory_for_column(:latlon,
    RGeo::Geographic.spherical_factory(:srid => 4326))
end
