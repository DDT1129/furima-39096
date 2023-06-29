class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :municipalities, :house_umber, :building, :phone, :user_id, :market_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}+\z/, message: 'is invalid' }
    validates :municipalities
    validates :house_umber
    validates :phone, format: { with: /\A\d{10,11}+\z/, message: 'is invalid' }
    validates :user_id
    validates :market_id
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, market_id: market_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_umber,
                   building: building, phone: phone, order_id: order.id)
  end
end
