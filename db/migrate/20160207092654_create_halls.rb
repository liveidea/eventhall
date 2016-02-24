class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.belongs_to :user
      t.text :description
      t.integer :price
      t.string :event_type

      t.timestamps null: false
    end
  end
end
