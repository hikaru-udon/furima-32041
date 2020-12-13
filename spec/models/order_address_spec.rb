require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    # item = Item.find(item_id = rand(1..10))
    # user = User.find(user_id) = rand(1..10)

    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品の購入' do
    context '商品を購入できる時' do
      it "全ての項目の入力が正しく存在すれば出品できること" do
        expect(@order_address).to be_valid
      end
    end
    
    context '商品を購入できない時' do
      it "postal_codeが空だと登録できない" do

        @order_address.postal_code = nil
        @order_address.valid?
        # binding.pry
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeはハイフンを含まなければ登録できない" do
        @order_address.postal_code = "0000000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code must be hyphen")
      end
      it "prefectureが空(---)だと登録できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture select")
      end
      it "cityが空だと登録できない" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "numberが空だと登録できない" do
        @order_address.number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Number can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberはハイフンがあると登録できない" do
        @order_address.phone_number = "090-1234-5678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberは11桁より多いと登録できない" do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
