class Repair < ApplicationRecord
    belongs_to :tech
    belongs_to :customer
end
