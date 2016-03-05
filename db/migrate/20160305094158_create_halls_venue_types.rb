class CreateHallsVenueTypes < ActiveRecord::Migration
  def change
      create_table :halls_venue_types do |t|
      t.integer "hall_id"
      t.integer "venue_type_id"
    end
  end
end
