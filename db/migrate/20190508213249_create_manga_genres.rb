class CreateMangaGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :manga_genres do |t|
      t.belongs_to :manga, foreign_key: true
      t.belongs_to :genre, foreign_key: true

      t.timestamps
    end
  end
end
