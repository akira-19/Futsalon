class CreateBookingFields < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_fields do |t|
      t.references :team, foreign_key: true, null: false
      t.references :field, foreign_key: true, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :price, null: false
      t.integer :payment_method, null: false
      t.boolean :payment, null: false, default: false
      t.boolean :confirm, null: false, default: false
      t.timestamps
    end
  end
end
