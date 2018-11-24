class AddColumnsToField < ActiveRecord::Migration[5.1]
  def change
    add_column :fields, :prefecture, :string
    add_column :fields, :city, :string
    add_column :fields, :num_of_field, :integer
  end
end
