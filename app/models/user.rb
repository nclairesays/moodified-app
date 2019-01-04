class User < ApplicationRecord

    validates :name, presence: true, uniqueness: {case_sensitive: false}

    has_many :mood_logs, dependent: :destroy #need this in order to destroy a user and all associated mood_logs
    has_many :moods, through: :mood_logs


    def self.sort_users
        self.all.sort_by{|u| u.name}
    end
end
