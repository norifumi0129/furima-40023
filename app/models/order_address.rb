class OrderAddress
  include ActiveModel::Model
  attr_accessor :image, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id,
                :order_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: 'は0から始まる10桁または11桁の整数で入力してください' }
    validates :user_id
    validates :item_id
  end
  def save
    order = Order.create(item_id:, user_id:)
    Address.create(postal_code:, prefecture_id:, city:, house_number:,
                   building_name:, phone_number:, order_id: order.id)
  end
end
