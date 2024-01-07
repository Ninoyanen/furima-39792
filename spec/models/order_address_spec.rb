require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていると保存できること' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'トークンが空であると保存できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it '郵便番号が空であると保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列でないと保存できない' do
        @order_address.postal_code = '１２３４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it '都道府県が空であると保存できない' do
        @order_address.prefecture = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市区町村が空であると保存できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Municipality can't be blank"
      end
      it '番地が空であると保存できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Street address can't be blank"
      end
      it '電話番号が空であると保存できない' do
        @order_address.phone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone num can't be blank"
      end
      it '電話番号が9桁以下では保存できない' do
        @order_address.phone_num = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone num is too short'
      end
      it '電話番号が12桁以上では保存できない' do
        @order_address.phone_num = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone num is invalid'
      end
      it '電話番号は半角数値以外の文字列があると保存できない' do
        @order_address.phone_num = '０９０―１２３４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone num is invalid. Input only number'
      end
      it 'userが紐づいていないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐づいていないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
