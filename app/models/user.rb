class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true, uniqueness: {case_sensitive: false}

    validates :email, presence: true, uniqueness: true #, format: { with: URI::MailTo::EMAIL_REGEXP } 


    has_many :mood_logs, dependent: :destroy #need this in order to destroy a user and all associated mood_logs
    has_many :moods, through: :mood_logs


    def self.sort_users
        self.all.sort_by{|u| u.name}
    end
end
