class CreateHallsVenueTypes < ActiveRecord::Migration
  def change
    create_table :halls_venue_types, id: false do |t|
      t.integer :hall_id, null: false
      t.integer :venue_type_id, null: false
    end
  end
end
