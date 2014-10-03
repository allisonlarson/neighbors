class Coordinate < ActiveRecord::Base
  set_rgeo_factory_for_column(:latlon,
    RGeo::Geographic.spherical_factory(:srid => 4326))
  belongs_to :locatable, polymorphic: true
end