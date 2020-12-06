class Device < ApplicationRecord
    has_many :repairs
    validates :name, presence: true, uniqueness: true
    validates :model, presence: true, uniqueness: true

    scope :alpha, -> {order(:name)}
end
