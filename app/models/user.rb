class User < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  validates :display_name, presence: true
  has_many :authorizations
  has_many :favorite_neighborhoods
  has_many :neighborhoods, through: :favorite_neighborhoods
  has_many :neighborhood_photos
  before_save :format_phone

  def self.create_from_hash!(hash)
    create(:name => hash['info']['name'],
           :display_name => hash['info']['nickname'],
           :image => hash['info']['image'],
           :city =>format_city(hash['info']['location']))
  end

  def self.format_city(location)
    location.split(',').first.capitalize
  end

  def save(area)
    self.neighborhoods << area
  end

  def forget(area)
    self.neighborhoods.destroy(area)
  end

  private

  def format_phone
    if phone_number != nil
      numbers = phone_number.gsub(/\D/, '')
      if numbers.length == 10
        self.phone_number = numbers.insert(0, '+1')
      elsif numbers.length == 11
        self.phone_number = numbers.insert(0,'+')
      end
    end
  end
end
