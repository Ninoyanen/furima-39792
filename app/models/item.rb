class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :image, :name, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :post_day_id
    validates :price, numericality: { only_integer: true, in: 300..9_999_999 }
  end

  belongs_to :user
  has_one :order

  # ActiveHashによるAssociation
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :post_day
end
