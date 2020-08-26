require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer)
  end


  describe '商品購入機能' do
    context '商品購入が上手くいく時' do
        it '全ての項目が入力されていれば購入できる' do
          expect(@buyer).to be_valid
        end
    end

    context '商品購入が上手くいかない時' do
      
      it '郵便番号が空だと購入できない' do
        @buyer.postal_code = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end
      
      it '都道府県が空だと購入できない' do
        @buyer.prefectures_id = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end
      
      it '市区町村が空だと購入できない' do
        @buyer.city = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end
      
      it '番地が空だと購入できない' do
        @buyer.address = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end
      
      it '電話番号が空だと購入できない' do
        @buyer.phone_number = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end
      
      it '郵便番号にハイフンがなければ購入できない' do
        @buyer.postal_code = '1234567'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end

      it '電話番号にハイフンがあると購入できない' do
        @buyer.phone_number = '090-1234-5678'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end

      it '電話番号が12桁以上だと購入できない' do
        @buyer.phone_number = '0901234567890'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end

    end
  end
end