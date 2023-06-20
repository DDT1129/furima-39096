require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '配送先住所情報の登録' do
    context '登録できるとき' do
      it '項目が全て正しく入力されたとき' do
        expect(@order_address).to be_valid
      end
      it 'user_idが空でないとき' do
        @order_address.user_id = '1'
        expect(@order_address).to be_valid
      end
      it 'market_idが空でないとき' do
        @order_address.market_id = '1'
        expect(@order_address).to be_valid
      end
      it '郵便番号は３桁の数字と４桁の数字の間にハイフンがあるとき' do
        @order_address.post_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it '都道府県の項目が---と空でないとき' do
        @order_address.prefecture_id = 2
        expect(@order_address).to be_valid
      end
      it '番地が空でないとき' do
        @order_address.municipalities = '東京都'
        expect(@order_address).to be_valid
      end
      it '建物名が空のとき' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
      it '電話番号が１０桁でハイフンがないとき' do
        @order_address.phone = '0901234567'
        expect(@order_address).to be_valid
      end
      it '電話番号が１１桁でハイフンがないとき' do
        @order_address.phone = '09012345678'
        expect(@order_address).to be_valid
      end
    end

    context '登録できないとき' do
      it 'user_idが空では登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'market_idが空では登録できない' do
        @order_address.market_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Market can't be blank")
      end
      it '郵便番号が空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end
      it '郵便番号にハイフンを入れないと登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県が空では登録できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が---では登録できない' do
        @order_address.prefecture_id = '---'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では登録できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空では登録できない' do
        @order_address.house_umber = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House umber can't be blank")
      end
      it '電話番号が空では登録できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
      end
      it '電話番号にハイフンがあるときは登録できない' do
        @order_address.phone = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号が１０桁未満のときは登録できない' do
        @order_address.phone = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号が１２桁以上のときは登録できない' do
        @order_address.phone = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
    
    end
  end
end
