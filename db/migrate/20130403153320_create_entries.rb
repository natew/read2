class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :link
      t.string :guid
      t.text :description
      t.timestamp :published
      t.timestamps
    end
  end
end
