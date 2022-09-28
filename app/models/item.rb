class Item < ApplicationRecord
  belongs_to :user

  validates :name,                        presence: true
  validates :price,                       presence: true
  validates :descryption,                 presence: true
  validates :status_id,                   presence: true
  validates :delivery_charge_defrayer_id, presence: true
  validates :day_id,                      presence: true
  validates :prefecture_id,               presence: true
  validates :category_id,                 presence: true
  
  
end
