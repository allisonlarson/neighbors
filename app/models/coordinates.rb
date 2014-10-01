class Coordinates < ActiveRecord::Base
  belongs_to :locatable, polymorphic: true
end
