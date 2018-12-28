class Rating < ApplicationRecord
    has_many :mood_logs
    has_many :moods, through: :mood_logs
end
