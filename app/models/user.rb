class User < ActiveRecord::Base
  validates :display_name, presence: true
  has_many :authorizations

  def self.create_from_hash!(hash)
    create(:name => hash['info']['name'], :display_name => hash['info']['nickname'], :image => hash['info']['image'])
  end
end
