class CreateSaves < ActiveRecord::Migration
  def change
    create_table :saves do |t|

      t.timestamps
    end
  end
end
