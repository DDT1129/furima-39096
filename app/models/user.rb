class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,
    presence: true
  validates :password,
    format: { with: /\A[a-zA-Z\d]+\z/, message: '６文字以上の半角英数字混合で入力してください'}  
  with_options presence: true,
    format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を入力してください' } do
      validates :first_name
      validates :last_name
    end
         
  with_options presence: true,
    format: { with: /\A[ァ-ヴ]+\z/, message: '全角(カタカナ)文字を入力してください'} do
      validates :first_name_kana
      validates :last_name_kana
    end
         
  validates :birthday, presence: true
      
 
       
  has_many :order_recodes
  has_many :items

end

