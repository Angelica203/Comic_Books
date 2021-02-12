class Comic < ApplicationRecord
    validates :title, :category, :published, :price, presence: { message: 'dont forget to fill out the fields'}
    validates :price, numericality: { greater_than: 0 }
    validates :title, uniqueness: { scope: [:published, :category], message: "already exist" }
    # validates :price_confirmation. presence: true


    has_many :purchases
    has_many :users, through: :purchases
    # belongs_to :purchase
    # accepts_nested_attributes_for :purchases
    
    
    def title_and_category
        "#{self.title} : #{self.category}"
    end

    def display_price
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