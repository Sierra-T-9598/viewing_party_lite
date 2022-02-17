class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email, null: false
  validates_uniqueness_of :email, case_sensitive: false
  validates_presence_of :password_digest
  has_secure_password
  has_many :user_parties
  has_many :parties, through: :user_parties
end
