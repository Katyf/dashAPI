class FeedSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :url
end
