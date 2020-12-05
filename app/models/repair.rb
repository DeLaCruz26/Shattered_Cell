class Repair < ApplicationRecord
    belongs_to :device
    belongs_to :user
    has_many :reviews
    has_many :users, through: :reviews
    accepts_nested_attributes_for :device

    def self.aplha
        order(:repair_time)
    end

    def device_attributes=(attributes)
        self.device = Device.find_or_create_by(attributes) if !attributes['name'].empty?
        self.device
    end

    def not_a_duplicate
        repair = Repair.find_by(repair_time: repair_time, device_id: device_id)
        if !!repair && repair != self
            errors.add(:repair_time, 'has already been scheduled for that device')
        end
    end

    def device_name
        device.try(:name)
    end

    def time_and_device
        "#{repair_time} - #{device.try(:name)}"
    end
end
