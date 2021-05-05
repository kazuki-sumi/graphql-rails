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

    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, Int, required: false
    end
    def user(id:)
      User.find(id)
    end

    field :video_clips, [Types::VideoClipType], null: false
    def video_clips
      VideoClip.all
    end

    field :all_links, resolver: Resolvers::LinksSearch

    def all_links
      Link.all
    end
  end
end
