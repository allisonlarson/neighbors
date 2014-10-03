class City < ActiveRecord::Base
  include PgSearch
  has_many :neighborhoods
  has_many :coordinates, as: :locatable
  multisearchable :against => [:name]
end
