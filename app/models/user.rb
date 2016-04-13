class User < ActiveRecord::Base

  has_secure_password

  has_many :groups
  has_many :members

  validates :gym_name, :email, :address, presence: true

end
