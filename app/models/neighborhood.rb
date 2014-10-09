class Neighborhood < ActiveRecord::Base
  include PgSearch
  extend FriendlyId

  belongs_to :city
  has_many :coordinates, as: :locatable
  multisearchable :against => [:name]
  friendly_id :name, use: :slugged
  has_many :favorite_neighborhoods
  has_many :users, through: :favorite_neighborhoods

end
