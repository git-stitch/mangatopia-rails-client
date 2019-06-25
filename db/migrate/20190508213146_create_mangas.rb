class CreateMangas < ActiveRecord::Migration[5.2]
  def change
    create_table :mangas do |t|
      t.string :cover_art
      t.string :name
      t.string :author
      t.string :manga_url

      t.timestamps
    end
  end
end
