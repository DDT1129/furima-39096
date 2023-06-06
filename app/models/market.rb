class Market < ApplicationRecord
  has_one_attached :image

  validates :image,
            presence: true
  validates :name,
            presence: true, length: { maximum: 40 }
  validates :explanation,
            presence: true, length: { maximum: 1000 }
  validates :explanation,
            presence: true
  validates :category_id,
            presence: true
  validates :detail_id,
            presence: true
  validates :shipping_price_id,
            presence: true
  validates :prefecture_id,
            presence: true
  validates :shipping_date_id,
            presence: true
  with_options presence: true, format: { with: /\A\d+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end                     
            
  


  belongs_to :user
  has_one :order_recode

  
end
