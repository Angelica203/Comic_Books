class Comic < ApplicationRecord
    validates :title, :category, :published, :price, presence: { message: 'dont forget to fill out the fields'}
    validates :price, numericality: { greater_than: 0 }
    validates :title, uniqueness: { scope: [:published, :category], message: "already exist" }
    has_many :purchases, dependent: :destroy 
    has_many :purchasers, through: :purchases, source: :user   #telling it where to look
    belongs_to :user
    accepts_nested_attributes_for :purchases

    def self.search(search)
        if search
          self.where("title LIKE ?", "%#{search}%")
        end
    end
    

    scope :order_by_title, -> { reorder("lower(title) ASC") }

    def title_and_category
        "#{self.title} : #{self.category}"
    end

#     def display_price
#         split_price = self.price.to_s.split(".")
#         if split_price[1].length == 1
#             split_price[1] << "0"
#         elsif split_price[1].length == 0
#             split_price[1] << "00"
#         end
#         display = split_price.join(".")
#         "$#{display}"
#     end
end