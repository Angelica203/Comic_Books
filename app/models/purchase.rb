class Purchase < ApplicationRecord
    belongs_to :comic
    belongs_to :user
    validates :purchase_total, :location,  presence: true
    
    def display_purchase_total
        split_price = self.price.to_s.split(".")
        if split_price[1].length == 1
            split_price[1] << "0"
        elsif split_price[1].length == 0
            split_price[1] << "00"
        end
        display = split_price.join(".")
        "$#{display}"
    end

end
