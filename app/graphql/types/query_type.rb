module Types
  class QueryType < Types::BaseObject
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    field :posts, [Types::PostType], null: false
    def posts
      Post.all
    end

    field :post, Types::PostType, null: false do
      argument :id, Int, required: false
    end
    def post(id:)
      Post.find(id)
    end

    field :users, [Types::UserType], null: false do
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, Int, required: false
    end
  end
end
