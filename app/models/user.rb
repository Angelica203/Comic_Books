class User < ApplicationRecord
has_many :purchases
has_many :comics, through: :purchases
end
