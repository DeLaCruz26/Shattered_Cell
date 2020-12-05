class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :reviewed_repairs, through: :reviews, source: :repair 
    has_many :repairs
    
    validates :username, uniqueness: true, presence: true
    validates :email, presence: true
end
