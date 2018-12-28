class User < ApplicationRecord
    has_many :mood_logs
    has_many :moods, through: :mood_logs
    has_many :ratings, through: :mood_logs
end
