class Order < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :order_name, presence: true
  validates :tel, length: { minimum: 10, maximum: 11}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true
end
