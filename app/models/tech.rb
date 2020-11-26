class Tech < ApplicationRecord
    has_secure_password
    has_many :repairs
    has_many :customers, through: :repairs

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :password, presence: true
end
