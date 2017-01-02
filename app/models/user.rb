class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  
  has_secure_password
  enum role: %w(default admin)

end
