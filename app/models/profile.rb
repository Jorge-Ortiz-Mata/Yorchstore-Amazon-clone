class Profile < ApplicationRecord
    belongs_to :user
    has_one_attached :avatar, dependent: :destroy

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :location, presence: true
    validates :genre, presence: true
    validates :cellphone, presence: true
    validates :bank_account, presence: true
    validates :bank_money, presence: true
    validates :user_card, presence: true
    validates :birth, presence: true
    validate :user_card_field

    def user_card_field
        if !(user_card === 'Seller' || user_card === 'Buyer')
            errors.add(:user_card, "must be either 'Seller' or 'Buyer'.")
        end
    end

end
