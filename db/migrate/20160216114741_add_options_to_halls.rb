class AddOptionsToHalls < ActiveRecord::Migration
  def change
   create_table :options do |t|
      t.string :name
      t.references :hall, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

