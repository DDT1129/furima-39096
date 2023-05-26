class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ--一-龥々ー]\z/, message: '全角文字を入力してください' } do
    validates :first_name
    validates :last_name
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶ--]\z/, message: '全角(カタカナ)文字を入力してください'} do
    validates :first_name_kana
    validates :last_name_kana
  end
  
  validates :birthday, presence: true

  validates :encrypted_password, format: { with: /\A[a-z\d]\z/, imessage: '英数字混合で入力してください'}

end

