class AddCityIdToHalls < ActiveRecord::Migration
  def change
   add_column :halls, :city_id, :integer
  end
end
