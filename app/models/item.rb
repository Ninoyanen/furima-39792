class Item < ApplicationRecord
  has_one_attached :image

  validates :image,            presence: true
  validates :name,             presence: true
  validates :content,          presence: true
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :delivery_cost_id, presence: true
  validates :prefecture_id,    presence: true
  validates :post_day_id,      presence: true
  validates :price,            presence: true, numericality: { only_integer: true, in: 300..9_999_999 }

  belongs_to :user
  # has_one :order

  # ActiveHashによるAssociation
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :post_day
end
