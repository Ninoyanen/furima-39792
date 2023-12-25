require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できるとき' do
      it '全項目が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できないとき' do
      it 'image（商品の画像）は空にできない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'name（商品名）は空にできない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'content（商品の説明）は空にできない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Content can't be blank"
      end
      it 'categoryは未選択にできない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'conditionは未選択にできない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'delivery_costは未選択にできない' do
        @item.delivery_cost = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery cost can't be blank"
      end
      it 'prefectureは未選択にできない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'post_dayは未選択にできない' do
        @item.post_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Post day can't be blank"
      end
      it 'priceは空にできない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceは数字以外では出品できない' do
        @item.price = 'aaああアア'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceは300から9999999までの数字でなければ出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be in 300..9999999"
      end
    end
  end
end
