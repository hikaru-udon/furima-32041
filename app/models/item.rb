class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_date

  validates :image, :name, :explanation, :price, presence: true
  validates :price, format: { with: /\A[0-9]+\z/}
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9999999 }
  validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_date_id,  numericality: { other_than: 1 }
end
