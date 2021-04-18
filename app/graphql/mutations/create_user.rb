module Mutations
  class CreateUser < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end
    # graphql_name 'CreateUser'
    # field :user, Types::UserType, null: true
    # field :result, Boolean, null: true

    argument :name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: false
    # argument :email, String, required: true
    # argument :password, String, required: true
    # argument :role, Integer, required: false

    type Types::UserType

    def resolve(name: nil, auth_provider: nil)
      user = User.create!(
        name: name,
        email: auth_provider&.[](:credentials)&.[](:email),
        password: auth_provider&.[](:credentials)&.[](:password)
      )
    end
  end
end
