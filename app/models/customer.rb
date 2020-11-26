class Customer < ApplicationRecord
    has_secure_password
    has_many :repairs
    has_many :techs, through: :repairs

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :password, presence: true
    validates :device, presence: true 
end
