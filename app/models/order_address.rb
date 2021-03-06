class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :number, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "はハイフンが必要です"}
    validates :prefecture_id, numericality: { other_than: 1, message:  "を選択してください"}
    validates :city
    validates :number
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
    validates :item_id
    validates :user_id
    validates :token
  end

  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, number: number, building: building, phone_number: phone_number, order_id: order.id)
  end
end