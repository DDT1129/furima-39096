class Order < ApplicationRecord
  belongs_to :user
  belongs_to :market
  has_one :address
end
