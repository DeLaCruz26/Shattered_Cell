class Tech < ApplicationRecord
    has_secure_password
    has_many :repairs
    has_many :customers, through: :repairs
end
