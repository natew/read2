class CreateSaves < ActiveRecord::Migration
  def change
    create_table :saves do |t|
      t.references :entry
      t.references :user
      t.timestamps
    end
  end
end
