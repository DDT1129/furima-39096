class Market < ApplicationRecord
  has_one_attached :image





  belongs_to :user
  has_one :order_recode

  private

  def message_params
    params.require(:market).permit(:name, :explanation, :price, :category_id, :detail_id, :shipping_date_id, :prefecture_id, :user_id, :image).merge(user_id: current_user.id)
  end
end
