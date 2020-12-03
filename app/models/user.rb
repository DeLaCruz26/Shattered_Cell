class User < ApplicationRecord
    has_secure_password
    has_many :devices
    has_many :repairs, through: :devices
end
