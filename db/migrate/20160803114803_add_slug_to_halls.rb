class AddSlugToHalls < ActiveRecord::Migration[5.0]
  def change
    add_column :halls, :slug, :string
    add_index :halls, :slug, unique: true
  end
end
