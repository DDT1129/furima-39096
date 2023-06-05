class Market < ApplicationRecord

  belongs_to :user
  has_one :order_recode
end
