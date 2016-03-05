class CreateEventTypesHallsTable < ActiveRecord::Migration
  def change
    create_table :event_types_halls_tables do |t|
                t.integer "hall_id"
          t.integer "event_type_id"
    end
  end
end
