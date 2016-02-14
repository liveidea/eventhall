class CreateHallVenueTypes < ActiveRecord::Migration
  def change
    create_table :halls_venue_types, id: false do |t|
      t.belongs_to :hall, index: true
      t.belongs_to :venue_type, index: true
    end
  end
end
