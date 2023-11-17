class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    with_options presence: true do
      validates :nickname
      validates :family_name
      validates :first_name
      validates :family_name_kana
      validates :first_name_kana
      validates :birthday
    end
end
