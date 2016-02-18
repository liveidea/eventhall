class RenameColumn < ActiveRecord::Migration
  def change
      rename_column :halls, :event_type_id, :event_type_ids
   rename_column :halls, :venue_type_id, :venue_type_ids
  end
end
