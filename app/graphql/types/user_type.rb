module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :password_digest, String, null: false
    field :role, Integer, null: true
    field :posts, [Types::PostType], null: false
    field :links, [Types::LinkType], null: false
    field :votes, [Types::VoteType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
