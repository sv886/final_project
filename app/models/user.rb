class User < ActiveRecord::Base

  has_secure_password

  has_many :groups

  validates :gym_name, :email, :password, :address, presence: true

end
