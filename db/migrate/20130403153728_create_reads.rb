class CreateReads < ActiveRecord::Migration
  def change
    create_table :reads do |t|

      t.timestamps
    end
  end
end
