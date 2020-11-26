class Repair < ApplicationRecord
    belongs_to :tech
    belongs_to :customer

    validates_datetime :repair_time, presence: true
    validates :repair_cost, numericality: { only_integer: true }
    validates :repair_desc, length: { minimum: 5 }
end
