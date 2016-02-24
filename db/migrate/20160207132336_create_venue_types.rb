class CreateVenueTypes < ActiveRecord::Migration
  def change
    create_table :venue_types do |t|
      t.string :name
      t.references :hall, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
