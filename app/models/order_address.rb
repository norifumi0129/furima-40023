class DonationAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}
end


  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end