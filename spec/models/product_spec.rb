require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('app/assets/images/star.png')
  end

  describe '商品出品機能' do
    context '商品出品が上手くいく時' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品が上手くいかない時' do
      it '画像がなければ出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空だと出品できない' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーが空だと出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空だと出品できない' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担が空だと出品できない' do
        @product.shipping_fee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it '発送元の地域が空だと出品できない' do
        @product.shipping_origin_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping origin can't be blank")
      end

      it '発送までの日数が空だと出品できない' do
        @product.shipping_price_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping price can't be blank")
      end

      it '価格が空だと出品できない' do
        @product.selling_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Selling price can't be blank")
      end

      it '価格の範囲が、¥300以下だと出品できない' do
        @product.selling_price = 200
        @product.valid?
        expect(@product.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end

      it '価格の範囲が、¥9,999,999以上だと出品できない' do
        @product.selling_price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
      end
    end
  end
end
