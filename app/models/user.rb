class User < ActiveRecord::Base
  validates :display_name, presence: true
  validates :email, presence: true
end
