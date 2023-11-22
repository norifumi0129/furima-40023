require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品が出品できる' do
    it 'image, name, introduction, priceが空でなくpriceが300以上かつ9999999以下でcategory_id, condition_id, postage_payer_id, prefecture_id, preparation_day_idが1以外の値を取れば なら出品できる' do
      expect(@item).to be_valid
    end
  end
  describe '商品が出品できない' do
    it 'imageが空なら出品できない' do
      @item.image = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'introductionが空なら出品できない' do
    end
    it 'priceが空なら出品できない' do
    end
    it 'priceが300未満なら出品できない' do
    end
    it 'priceが10000000以上なら出品できない' do
    end
    it 'category_idが1なら出品できない' do
    end
    it 'condition_idが1なら出品できない' do
    end
    it 'postage_payer_idが1なら出品できない' do
    end
    it 'prefecture_idが1ならなら出品できない' do
    end
    it 'preparation_day_idが1なら出品できない' do
    end
    it 'imageが空なら出品できない' do
    end
    it 'imageが空なら出品できない' do
    end
  end
end
