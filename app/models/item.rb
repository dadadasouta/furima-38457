class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_charge_defrayer
    belongs_to :prefecture
    belongs_to :day

  validates :name,                        presence: true
  validates :description,                 presence: true, length: { minimum: 1, maximum: 1000 }
  validates :image,                       presence: true
  validates :category_id,                 numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id,                   numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_defrayer_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,               numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id,                      numericality: { other_than: 1 , message: "can't be blank"}
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end

  belongs_to :user
  has_one_attached :image

end
