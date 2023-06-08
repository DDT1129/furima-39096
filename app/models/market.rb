class Market < ApplicationRecord
  has_one_attached :image

  validates :image,
            presence: true
  validates :name,
            presence: true, length: { maximum: 40 }
  validates :explanation,
            presence: true, length: { maximum: 1000 }
  
  with_options numericality: { other_than: 1 ,message: "can't be blank" } do
    validates :category_id  
    validates :detail_id   
    validates :shipping_price_id
    validates :prefecture_id
    validates :shipping_date_id        
  end
  
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 , message: "は、¥300〜9,999,999の間で半角で入力して下さい"}
                       
            
  


  belongs_to :user
  has_one :order_recode

  
end
