module Mutations
  class CreateUser < BaseMutation
    # class AuthProviderSignupData < Types::BaseInputObject
    #   argument :credentials, Types::AuthProviderCredentialsInput, required: false
    # end
    graphql_name 'CreateUser'
    field :user, Types::UserType, null: true
    field :result, Boolean, null: true

    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :role, Integer, required: false

    def resolve(**args)
      user = User.create(name: args[:name], email: args[:email], password: args[:password], role: args[:role])
      {
        user: user,
        result: user.errors.blank?
      }
    end
  end
end
