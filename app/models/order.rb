class Order < ApplicationRecord
  belongs_to :user
  belongs_to :article
  #validates :quantity, presence: true
  #validates :product, presence: true
  #validates :user_id, presence: true
  #validates :article_id, presence: true
end
