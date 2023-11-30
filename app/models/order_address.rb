class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :user_id, :item_id,
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :phone_number
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, order_id: order.id)
  end
end