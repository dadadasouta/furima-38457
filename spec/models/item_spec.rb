require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品の出品ができるとき' do
      it '全ての情報が入力されていれば商品を出品することができる' do
        expect(@item).to be_valid
      end

      it 'nameが入力されていれば出品できる' do
        @item.name = 'item'
        expect(@item).to be_valid
      end

      it 'descriptionが入力されていれば商品を出品することができる' do
        @item.description = 'good'
        expect(@item).to be_valid
      end

      it 'category_idが---でなければ商品を出品することができる' do
        @item.category_id = '2'
        expect(@item).to be_valid
      end

      it 'status_idが---でなければ商品を出品することができる' do
        @item.status_id = '2'
        expect(@item).to be_valid
      end

      it 'delivery_charge_defrayer_idが---でなければ商品を出品することができる' do
        @item.delivery_charge_defrayer_id = '2'
        expect(@item).to be_valid
      end

      it 'prefecture_idが---でなければ商品を出品することができる' do
        @item.prefecture_id = '2'
        expect(@item).to be_valid
      end

      it 'day_idが---でなければ商品を出品することができる' do
        @item.day_id = '2'
        expect(@item).to be_valid
      end

      it 'priceが300~9,999,999であれば商品を出品することができる' do
        @item.price = '777'
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it 'imageが空だと商品を出品することができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと出品することができない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriotionが空だと出品することができない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'status_idが空だと出品することができない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'delivery_charge_defrayer_idが空だと出品することができない' do
        @item.delivery_charge_defrayer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge defrayer can't be blank")
      end

      it 'day_idが空だと出品することができない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end

      it 'prefecture_idが空だと出品することができない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'category_idが空だと出品することができない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'priceが空だと商品を出品することができない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is invalid', 'Price is not a number')
      end

      it 'priceが299以下だと出品することができない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが10,000,000以上だと出品することができない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが全角文字だと出品することができない' do
        @item.price = '７７７'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが数字ではなく文字だと出品することができない' do
        @item.price = 'item'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
