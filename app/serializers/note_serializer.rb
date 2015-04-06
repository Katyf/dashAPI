class NoteSerializer < ActiveModel::Serializer
  attributes :body, :id, :user_id
end
