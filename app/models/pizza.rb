class Pizza < ApplicationRecord
    has_many :orders, through: :order_lines
end
