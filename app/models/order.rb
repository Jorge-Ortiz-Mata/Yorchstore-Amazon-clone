class Order < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :quantity, presence: true
  validates :product_title, presence: true
  validates :product_description, presence: true
  validates :user_id, presence: true
  validates :article_id, presence: true
end
