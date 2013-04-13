class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :url, null: false
      t.string :etag
      t.string :category
      t.string :author
      t.text :content

      t.references :site
      t.timestamp :published
      t.timestamps
    end
  end
end
