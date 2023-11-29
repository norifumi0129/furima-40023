class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Include hyphen(-)' }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  def save
    # 変数orderに代入する
    order = Order.create(item_id:, user_id:)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postal_code:, prefecture_id:, city:, house_number:,
                   building_name:, order_id: order.id)
  end
end