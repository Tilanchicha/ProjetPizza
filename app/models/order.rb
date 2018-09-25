class Order < ApplicationRecord
  has_many :pizzas, through: :order_line
  
end
