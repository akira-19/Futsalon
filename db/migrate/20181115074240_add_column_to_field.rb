class AddColumnToField < ActiveRecord::Migration[5.1]
  def change
    add_column :fields, :name, :string, nil: false
  end
end
