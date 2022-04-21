class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :email, :password

  # verify user credentials
  # rubocop:disable Style/GuardClause
  def user
    user = User.find_for_database_authentication(email: email)
    if user.valid_password?(password: password)
      user
    else
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end
  # rubocop:enable Style/GuardClause
end
