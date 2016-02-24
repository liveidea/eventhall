class CreateJoinTableHallEventType < ActiveRecord::Migration
  def change
   create_table :hall_event_types, id: false do |t|
    t.integer :hall_id, null: false
    t.integer :event_type_id, null: false
  end
  end
end
