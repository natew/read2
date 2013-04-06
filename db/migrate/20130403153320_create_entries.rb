class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :link, null: false
      t.string :guid
      t.string :image
      t.string :category
      t.string :copyright
      t.string :author
      t.text :description

      t.references :site
      t.timestamp :published
      t.timestamps
    end
  end
end
