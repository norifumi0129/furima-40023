class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/u, message: '氏名は全角でお願いします。' } do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/u, message: 'カナは全角カタカナでお願いします。' } do
    validates :family_name_kana
    validates :first_name_kana
  end
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/i, message: 'パスワードは英数字混合の６文字以上です。' }
end
