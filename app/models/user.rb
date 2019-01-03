class User < ApplicationRecord
    has_many :mood_logs, dependent: :destroy #need this in order to destroy a user and all associated mood_logs
    has_many :moods, through: :mood_logs
end
