class User < ApplicationRecord
has_many :purchases
has_many :comics, through: :purchases
 has_many :comics #user create

has_secure_password

validates :username, :email, presence: true
validates :email, uniqueness: true
# validates :password_confirmation, presence: true

end
