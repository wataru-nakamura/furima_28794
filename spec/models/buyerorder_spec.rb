require 'rails_helper'

RSpec.describe Buyerorder, type: :model do
  before do
    @buyer = FactoryBot.build(:buyerorder)
  end

  describe '商品購入機能' do
    context '商品購入が上手くいく時' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@buyer).to be_valid
      end
    end

    context '商品購入が上手くいかない時' do
      it 'tokenが空の場合購入できない' do
        @buyer.token = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと購入できない' do
        @buyer.postal_code = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
      end

      it '都道府県が空だと購入できない' do
        @buyer.prefectures_id = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Prefectures can't be blank", 'Prefectures is not a number')
      end

      it '市区町村が空だと購入できない' do
        @buyer.city = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと購入できない' do
        @buyer.address = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @buyer.phone_number = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end

      it '郵便番号にハイフンがなければ購入できない' do
        @buyer.postal_code = '1234567'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Postal code is invalid')
      end

      it '電話番号にハイフンがあると購入できない' do
        @buyer.phone_number = '090-1234-5678'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が12桁以上だと購入できない' do
        @buyer.phone_number = '0901234567890'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Phone number is invalid')
      end

      it '都道府県が{--}の場合購入できない' do
        @buyer.prefectures_id = '1'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Prefectures must be other than 1')
      end
    end
  end
end
