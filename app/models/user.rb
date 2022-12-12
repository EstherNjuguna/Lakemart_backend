class User < ApplicationRecord
    enum :user_type, {buyer:0, seller:1, admin:2}
    has_many :products, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :carts, dependent: :destroy
end
