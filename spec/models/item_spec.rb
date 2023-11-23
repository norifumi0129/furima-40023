require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: user)
  end
  describe '商品出品' do
    context '商品が出品できる' do
      it 'image, name, introduction, priceが空でなくpriceが300以上かつ9999999以下ならば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない' do
      it 'imageが空なら出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空なら出品できない'do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが41文字以上だと出品できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
  
      it 'introductionが空なら出品できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
  
      it 'introductionが1001字以上なら出品できない' do
        @item.introduction = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction is too long (maximum is 1000 characters)")
      end
  
      it 'priceが空なら出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
  
      it 'priceが300未満なら出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
  
      it 'priceが10000000以上なら出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceは半角数字以外で入力すると出品できない' do
        @item = Item.new(price: 'abc')
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
      end
      it 'category_idが1なら出品できない' do
        category_id = 1
        item = FactoryBot.build(:item, user: @user, category_id: category_id)
        expect(item).not_to be_valid
        expect(item.errors[:category_id]).to include("must be other than 1")
      end
      it 'condition_idが1なら出品できない' do
        condition_id = 1
        item = FactoryBot.build(:item, user: @user, condition_id: condition_id)
        expect(item).not_to be_valid
        expect(item.errors[:condition_id]).to include("must be other than 1")
      end
      it 'postage_payer_idが1なら出品できない' do
        postage_payer_id = 1
        item = FactoryBot.build(:item, user: @user, postage_payer_id: postage_payer_id)
        expect(item).not_to be_valid
        expect(item.errors[:postage_payer_id]).to include("must be other than 1")
      end
      it 'prefecture_idが1ならなら出品できない' do
        prefecture_id = 1
        item = FactoryBot.build(:item, user: @user, prefecture_id: prefecture_id)
        expect(item).not_to be_valid
        expect(item.errors[:prefecture_id]).to include("must be other than 1")
      end
      it 'preparation_day_idが1なら出品できない' do
        preparation_day_id = 1
        item = FactoryBot.build(:item, user: @user, preparation_day_id: preparation_day_id)
        expect(item).not_to be_valid
        expect(item.errors[:preparation_day_id]).to include("must be other than 1")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
