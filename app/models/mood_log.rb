class MoodLog < ApplicationRecord
  belongs_to :mood #, optional: true
  belongs_to :user #, optional: true
  belongs_to :rating

  validates :user_name, presence: true
  validates :mood_name, presence: true

  def user_name=(name)
    user = User.find_or_create_by(name: name)
    self.user = user
    # self.user = Mood.find_or_create_by(name: name)
  end
    
  def user_name
    self.user ? self.user.name : nil
    # self.try(:mood).try(:name)
  end

  def mood_name=(name)
    mood = Mood.find_or_create_by(name: name)
    self.mood = mood
    # self.mood = Mood.find_or_create_by(name: name)
  end
    
  def mood_name
    self.mood ? self.mood.name : nil
    # self.try(:mood).try(:name)
  end

  def date_time
    self.updated_at.strftime('%B%e, %Y at %l:%M%P')
  end

  def self.sort_logs
    self.all.sort_by{|ml| ml.updated_at}
end

end
