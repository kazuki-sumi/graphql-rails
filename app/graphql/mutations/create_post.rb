module Mutations
  class CreatePost < BaseMutation
    graphql_name 'CreatePost'
    field :post, Types::PostType, null: true
    field :result, Boolean, null: true

    argument :title, String, required: false
    argument :description, String, required: false
    argument :user_id, ID, required: false

    def resolve(**args)
      post = Post.create(title: args[:title], description: args[:description], user_id: args[:user_id])
      {
        post: post,
        result: post.errors.blank?
      }
    end
  end
end
