class Purchase < ApplicationRecord
    belongs_to :comic
    belongs_to :user
    validates :purchase_total, :location,  presence: true
    
end
