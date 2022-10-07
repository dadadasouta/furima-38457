require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address,item_id: @item.id,user_id: @user.id)
    sleep 0.1
  end

  describe "商品の購入機能" do
    context "商品の購入ができるとき" do
      it "全ての値が正しく入力されていれば購入できる" do
        expect(@order_address).to be_valid
      end

      it "建物名が空でも購入できる" do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context "商品の購入ができないとき" do
      it "postal_codeが空だと商品を購入することができない" do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it "postal_codeは3桁-4桁でないと商品を購入することができない" do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "postal_codeが全角数字だと商品を購入することができない" do
        @order_address.postal_code = '１２３-４５６'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "prefecture_idが空だと商品を購入することができない" do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空だと商品を購入することができない" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it "addressesが空だと商品を購入することができない" do
        @order_address.addresses = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end

      it "phone_numberが空だと商品を購入することができない" do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid.")
      end

      it "phone_numberが全角数字だと商品を購入することができない" do
        @order_address.phone_number = '０８０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it "phone_numberに-が入っていると商品を購入することができない" do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it "phone_numberが9桁以下だと商品を購入することができない" do
        @order_address.phone_number = '080123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it "tokenが空だと商品を購入することができない" do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空だと商品を購入することができない" do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空だと商品を購入することができない" do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      
    end
  end
end

# bundle exec rspec spec/models/order_address_spec.rb
# @order_address.errors.full_messages