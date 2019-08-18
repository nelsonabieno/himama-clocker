class User < ApplicationRecord
  class User < ApplicationRecord
    has_secure_password
    has_many :clock_events, dependent: :delete_all
    validates :first_name, presence:true
    validates :last_name, presence:true
    validates :email, presence:true, uniqueness:true, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :password, presence:true, length: { minimum: 5 }
  end

end
