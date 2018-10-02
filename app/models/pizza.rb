class Pizza < ApplicationRecord
    has_many :order, through: :
end
