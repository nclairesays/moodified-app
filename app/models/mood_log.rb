class MoodLog < ApplicationRecord
  belongs_to :mood
  belongs_to :user
  belongs_to :rating
end
