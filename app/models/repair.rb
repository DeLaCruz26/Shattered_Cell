class Repair < ApplicationRecord
    belongs_to :device
    belongs_to :user
    has_many :reviews
    has_many :users, through: :reviews
    accepts_nested_attributes_for :device

    validates :repair_time, presence: true
    validate :not_a_duplicate

    scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

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

    def device_model
        device.try(:model)
    end

    def time_and_device_model
        "#{repair_time} - #{device.try(:name)} #{device.try(:model)}"
    end
end
