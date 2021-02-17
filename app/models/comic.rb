class Comic < ApplicationRecord
    validates :title, :category, :published, :price, presence: { message: 'dont forget to fill out the fields'}
    validates :price, numericality: { greater_than: 0 }
    validates :title, uniqueness: { scope: [:published, :category], message: "already exist" }
    # validates :price_confirmation. presence: true


    has_many :purchases
    has_many :purchasers, through: :purchases, source: :user   #telling it where to look
    belongs_to :user
    accepts_nested_attributes_for :purchases
    
    scope :order_by_title, -> {order(title: :desc)}
end