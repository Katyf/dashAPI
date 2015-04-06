class SettingSerializer < ActiveModel::Serializer
  attributes :themes, :feeds, :id, :locations, :user_id
end
