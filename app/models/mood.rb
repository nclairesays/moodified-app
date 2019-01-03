class Mood < ApplicationRecord
    has_many :mood_logs #, dependent: :destroy
    has_many :users, through: :mood_logs
    has_many :ratings, through: :mood_logs

end
