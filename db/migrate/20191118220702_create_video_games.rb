class CreateVideoGames < ActiveRecord::Migration[6.0]
  def change
    create_table :video_games do |t|
      t.string :title
      t.integer :year
      t.string :genre
      t.boolean :owned
      t.boolean :played
      t.integer :rating
      t.text :about
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
