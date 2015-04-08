class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :token, :links, :settings, :notes, :feeds
end
