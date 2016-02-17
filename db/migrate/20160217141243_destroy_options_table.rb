class DestroyOptionsTable < ActiveRecord::Migration
  def down
      create_table :options
  end

 def up
   drop_table :options
end

end
