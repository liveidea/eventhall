class AddNameToHall < ActiveRecord::Migration
  def change
    add_column :halls, :name, :string
  end
end
