class Product < ApplicationRecord
    belongs_to :user, dependent: :destroy
end
