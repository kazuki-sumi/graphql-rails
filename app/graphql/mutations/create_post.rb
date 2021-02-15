module Mutations
  class CreatePost < BaseMutation
    graphql_name 'CreatePost'
    field :post, Types::PostType, null: true
    field :result, Boolean, null: true

    argument :title, String, required: false
    argument :description, String, required: false
    argument :status, Integer, required: false
    argument :user_id, ID, required: true

    def resolve(**args)
      user = User.find(args[:user_id])
      post = user.posts.build(title: args[:title], description: args[:description], status: args[:status])
      post.save
      {
        post: post,
        result: post.errors.blank?
      }
    end
  end
end
