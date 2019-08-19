class User < ApplicationRecord
    has_many :clock_events, dependent: :delete_all
    validates :user_nick, presence:true, length: { minimum: 5 }, uniqueness: true
end
