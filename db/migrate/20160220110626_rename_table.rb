class RenameTable < ActiveRecord::Migration
  def change
  rename_table :hall_event_type, :event_types_halls
  add_column :event_types, :hall_id, :integer
  end
end
