class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:email,:picture,:user_type
end
