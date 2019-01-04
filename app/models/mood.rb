class Mood < ApplicationRecord
    validates :name, presence: true, uniqueness: {case_sensitive: false}

    has_many :mood_logs #, dependent: :destroy
    has_many :users, through: :mood_logs
    has_many :ratings, through: :mood_logs


    def self.sort_moods
        self.all.sort_by{|m| m.name}
    end

end
