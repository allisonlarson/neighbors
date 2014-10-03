class Neighborhood < ActiveRecord::Base
  include PgSearch
  belongs_to :city
  has_many :coordinates, as: :locatable
  multisearchable :against => [:name]
end
