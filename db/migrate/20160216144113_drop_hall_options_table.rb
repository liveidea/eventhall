class DropHallOptionsTable < ActiveRecord::Migration
  def down
      drop_table :hall_options
  end

 def up
   create_table :hall_options
end
end
