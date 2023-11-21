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

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_payer
  belongs_to :preparation_day
end