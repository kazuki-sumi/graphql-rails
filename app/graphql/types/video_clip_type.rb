module Types
  class VideoClipType < Types::BaseObject
    field :id, ID, null: false
    field :preview_url, String, null: false
    field :resolution, Integer, null: false
    field :post_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
