class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true

  with_options numericality: { other_than: 1 }, presence: true do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :preparation_day_id
    validates :prefecture_id
  end
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates_format_of :price, with: /\A\d+\z/, message: 'は半角数値のみ入力してください', if: -> { price.present? }

  validates :name, presence: true, format: { with: /\A.{1,40}\z/, message: 'is too long (maximum is 40 characters)' }
  validates :introduction, presence: true, format: { with: /\A.{1,1000}\z/, message: 'is too long (maximum is 1000 characters)' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_payer
  belongs_to :preparation_day
end
