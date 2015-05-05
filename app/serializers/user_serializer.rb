class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :location, :token, :links, :settings, :notes, :feeds
end
