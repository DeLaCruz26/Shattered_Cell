class Repair < ApplicationRecord
    belongs_to :user
    has_many :devices
    has_many :users, through: :devices


end
