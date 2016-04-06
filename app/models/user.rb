class User < ActiveRecord::Base

  has_secure_password

  validates :gym_name, :email, :password, :address, presence: true

end
