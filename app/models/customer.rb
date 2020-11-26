class Customer < ApplicationRecord
    has_secure_password
    has_many :repairs
    has_many :techs, through: :repairs
end
