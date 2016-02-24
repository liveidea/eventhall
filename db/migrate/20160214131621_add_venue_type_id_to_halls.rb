class AddVenueTypeIdToHalls < ActiveRecord::Migration
  def change
   add_column :halls, :venue_type_id, :integer
  end
end
