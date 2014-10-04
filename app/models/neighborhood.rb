class Neighborhood < ActiveRecord::Base
  include PgSearch
  extend FriendlyId
  belongs_to :city
  has_many :coordinates, as: :locatable
  multisearchable :against => [:name]
  friendly_id :name, use: :slugged
end
