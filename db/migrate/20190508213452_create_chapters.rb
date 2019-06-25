class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.integer :chapter_number
      t.string :chapter_url
      t.belongs_to :manga, foreign_key: true

      t.timestamps
    end
  end
end
