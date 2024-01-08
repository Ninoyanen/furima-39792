class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :municipality, :street_address, :building, :phone_num, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture, :municipality, :street_address, :user_id, :item_id
  end
  validate :validate_phone_num

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, street_address: street_address, building: building, phone_num: phone_num, order_id: order.id)
  end

  private

  def validate_phone_num
    if phone_num.blank?
      errors.add(:phone_num, "can't be blank")
    elsif phone_num.length < 10
      errors.add(:phone_num, 'is too short')
    elsif phone_num.length > 11
      errors.add(:phone_num, 'is invalid')
    elsif phone_num !~ /\A\d+\z/
      errors.add(:phone_num, 'is invalid. Input only number')
    end
  end
end
