class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :zipcode, :token, :links, :settings, :notes, :feeds
end
