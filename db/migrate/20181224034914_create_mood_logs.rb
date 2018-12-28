class CreateMoodLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :mood_logs do |t|
      t.belongs_to :mood, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.belongs_to :rating, foreign_key: true

      t.timestamps
    end
  end
end
