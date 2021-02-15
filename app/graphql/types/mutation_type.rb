module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    # field :delete_post, mutation: Mutations::DeletePost
    # field :update_post, mutation: Mutations::UpdatePost
    field :create_post, mutation: Mutations::CreatePost
  end
end
