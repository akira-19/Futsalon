class ChangeDataTypePriceOfFields < ActiveRecord::Migration[5.1]
  def change
    change_column :fields, :price, :integer
  end
end
