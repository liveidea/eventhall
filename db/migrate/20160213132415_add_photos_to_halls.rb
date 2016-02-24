class AddPhotosToHalls < ActiveRecord::Migration
  def change
    add_column :halls, :photos, :string
  end
end
