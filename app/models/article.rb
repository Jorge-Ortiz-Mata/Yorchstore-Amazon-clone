class Article < ApplicationRecord
    belongs_to :user
    has_many_attached :images, dependent: :destroy
    has_many :orders
    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :user_id, presence: true
    validates :stock, presence: true
    after_create_commit {broadcast_prepend_to "articles"}
    after_update_commit {broadcast_replace_to "articles"}
    after_destroy_commit {broadcast_remove_to "articles"}
end
