class AddCheckedFieldToModel < ActiveRecord::Migration
  def change
    add_column :halls, :checked, :boolean
  end
end
