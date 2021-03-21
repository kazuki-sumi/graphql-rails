module Mutations
  class SignInUser < BaseMutation
    null true

    argument :email, String, required: false
    argument :password, String, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true

    # resolveメソッドはfieldで定義した
    # TODO やり直し
    def resolve(**args)
      return unless args

      user = User.find_by(email: args[:email])

      return unless user
      return unless user.authenticate(args[:password])

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")

      { user: user, token: token }
    end
  end
end
