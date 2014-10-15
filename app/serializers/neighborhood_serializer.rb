class NeighborhoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
  has_many :coordinates
end
