class User < ActiveRecord::Base
  validates :display_name, presence: true
  has_many :authorizations
  has_many :favorite_neighborhoods
  has_many :neighborhoods, through: :favorite_neighborhoods

  def self.create_from_hash!(hash)
    create(:name => hash['info']['name'],
           :display_name => hash['info']['nickname'],
           :image => hash['info']['image'],
           :city =>format_city(hash['info']['location']))
  end

  def self.format_city(location)
    location.split(',').first.capitalize
  end
end
