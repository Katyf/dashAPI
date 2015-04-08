class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :body, :author
end
