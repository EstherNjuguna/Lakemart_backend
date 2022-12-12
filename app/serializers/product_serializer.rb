class ProductSerializer < ActiveModel::Serializer
  attributes :id,:name,:description,:price,:category,:picture,:user_id
end
