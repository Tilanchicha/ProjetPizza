class Order < ApplicationRecord
  validates :name, :adresse, presence: true
  has_many :pizzas, through: :order_lines
  
end
