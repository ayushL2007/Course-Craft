class User < ApplicationRecord
  has_secure_password

  before_save { self.email = email.downcase }

  validates :email, presence: true
  validates :username, presence: true, uniqueness: true

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :paths
  has_many :path_infos, through: :path
end
