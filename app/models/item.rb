class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :preparation_day_id
    validates :prefecture_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :name, format: { with: /^.{1,40}$/ ,message:"商品名は40文字以下です。"}
  validates :introduction, format: { with: /^.{1,1000}$/ ,message:"説明は1000文字以内です。"}
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_payer
  belongs_to :preparation_day
end