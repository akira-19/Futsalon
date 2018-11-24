class AddColumnToTounamentCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :tounament_companies, :name, :string
  end
end
