class RenameTableHallEventTypes < ActiveRecord::Migration
  def change
   rename_table :hall_event_types, :event_types_halls
   add_column :event_types, :hall_id, :integer
  end
end
