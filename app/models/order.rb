class Order < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :quantity, presence: true
  validates :product_title, presence: true
  validates :product_description, presence: true
  validates :user_id, presence: true
  validates :article_id, presence: true
  after_create_commit {broadcast_prepend_to "orders"}
  after_update_commit {broadcast_replace_to "orders"}
  after_destroy_commit {broadcast_remove_to "orders"}
end
