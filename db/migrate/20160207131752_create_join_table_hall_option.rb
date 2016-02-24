class CreateJoinTableHallOption < ActiveRecord::Migration
  def change
   create_table :hall_options, id: false do |t|
    t.integer :hall_id, null: false
    t.integer :option_id, null: false
  end
  end
end
