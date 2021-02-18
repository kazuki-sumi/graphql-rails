module Mutations
  class UpdatePost < BaseMutation
    graphql_name "UpdatePost"

    field :post, Types::PostType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :status, Integer, required: false

    def resolve(**args)
      post = Post.find(args[:id])
      post.update(title: args[:title], description: args[:description], status: args[:status])
      {
        post: post,
        result: post.errors.blank?
      }
    end
  end
end
