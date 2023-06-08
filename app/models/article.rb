class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :detail
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :shipping_price
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :detail_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :shipping_price_id
  end
end
