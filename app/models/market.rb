class Market < ApplicationRecord
  has_one_attached :image





  belongs_to :user
  has_one :order_recode
end
