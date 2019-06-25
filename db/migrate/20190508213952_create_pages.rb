class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.integer :page_number
      t.string :page_url
      t.belongs_to :chapter, foreign_key: true

      t.timestamps
    end
  end
end
