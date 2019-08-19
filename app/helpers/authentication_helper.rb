module AuthenticationHelper
  def user_exists? user_nick
    User.find_by_user_nick("#{user_nick}")
  end
end
