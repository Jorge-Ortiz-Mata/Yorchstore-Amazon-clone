class Article < ApplicationRecord
    belongs_to :user
    has_many_attached :images, dependent: :destroy
    has_many :orders
    after_create_commit {broadcast_prepend_to "articles"}
    after_update_commit {broadcast_replace_to "articles"}
    after_destroy_commit {broadcast_remove_to "articles"}

    def self.look_up(article_id, quantity)
        article = find(article_id.to_i)
    end

end
