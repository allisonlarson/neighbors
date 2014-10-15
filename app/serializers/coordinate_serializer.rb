class CoordinateSerializer < ActiveModel::Serializer
  attributes :lat, :lon, :locatable_id
end
