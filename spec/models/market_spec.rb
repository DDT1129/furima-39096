require 'rails_helper'

RSpec.describe Market, type: :model do
  before do
    @market = FactoryBot.build(:market)
  end

  describe '商品情報の登録' do
    context '登録できるとき' do
      it '全項目が入力されていれば登録できる' do
        expect(@market).to be_valid
      end
      it 'nameが40字以内であれば登録できる' do
        @market.name = Faker::Lorem.characters(number: 40)
        expect(@market).to be_valid
      end
      it 'explanationが1000字以内であれば登録できる' do
        @market.explanation = Faker::Lorem.characters(number: 1000)
        expect(@market).to be_valid
      end
      it 'priceが半角であれば登録できる' do
        expect(@market).to be_valid
      end
      it 'priceが300以上9,999,999以内であれば登録できる' do
        @market.price = Faker::Number.between(from: 300, to: 9_999_999)
        expect(@market).to be_valid
      end
    end

    context '登録できないとき' do
      it 'imageが空では登録できない' do
        @market.image = nil
        @market.valid?
        expect(@market.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @market.name = ''
        @market.valid?
        expect(@market.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameは40文字以内でないと登録できない' do
        @market.name = Faker::Lorem.characters(number: 41)
        @market.valid?
        expect(@market.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'explanationが空では登録できない' do
        @market.explanation = ''
        @market.valid?
        expect(@market.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'explanationは1000文字以内でないと登録できない' do
        @market.explanation = Faker::Lorem.characters(number: 1001)
        @market.valid?
        expect(@market.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
      end
      it 'category_idが空では登録できない' do
        @market.category_id = 1
        @market.valid?
        expect(@market.errors.full_messages).to include("Category can't be blank")
      end
      it 'detail_idが空では登録できない' do
        @market.detail_id = 1
        @market.valid?
        expect(@market.errors.full_messages).to include("Detail can't be blank")
      end
      it 'shipping_price_idが空では登録できない' do
        @market.shipping_price_id = 1
        @market.valid?
        expect(@market.errors.full_messages).to include("Shipping price can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @market.prefecture_id = 1
        @market.valid?
        expect(@market.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_date_idが空では登録できない' do
        @market.shipping_date_id = 1
        @market.valid?
        expect(@market.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'priceが空では登録できない' do
        @market.price = ''
        @market.valid?
        expect(@market.errors.full_messages).to include('Price は、¥300〜9,999,999の間で半角で入力して下さい')
      end
      it 'priceが300〜9,999,999の間であっても、全角では登録できない' do
        @market.price = '１０００'
        @market.valid?
        expect(@market.errors.full_messages).to include('Price は、¥300〜9,999,999の間で半角で入力して下さい')
      end
      it 'priceが300未満では登録できない' do
        @market.price = '100'
        @market.valid?
        expect(@market.errors.full_messages).to include('Price は、¥300〜9,999,999の間で半角で入力して下さい')
      end
      it 'priceが10,000,000以上では登録できない' do
        @market.price = '10,000,000'
        @market.valid?
        expect(@market.errors.full_messages).to include('Price は、¥300〜9,999,999の間で半角で入力して下さい')
      end
      it 'userが紐付いていなければ登録できない' do
        @market.user = nil
        @market.valid?
        expect(@market.errors.full_messages).to include('User must exist')
      end
    end
  end
end
