class CreateReads < ActiveRecord::Migration
  def change
    create_table :reads do |t|
      t.references :user
      t.references :entry
      t.timestamps
    end
  end
end
