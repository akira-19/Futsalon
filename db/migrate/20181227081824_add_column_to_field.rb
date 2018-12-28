class AddColumnToField < ActiveRecord::Migration[5.1]
  def change
    add_column :fields, :price, :string
  end
end
