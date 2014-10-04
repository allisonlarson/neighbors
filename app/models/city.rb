class City < ActiveRecord::Base
  include PgSearch
  extend FriendlyId
  has_many :neighborhoods
  has_many :coordinates, as: :locatable
  multisearchable :against => [:name]
  friendly_id :name, use: :slugged
end
