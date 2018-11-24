class CreateBookingTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_tournaments do |t|
      t.references :tournament, foreign_key: true, null: false
      t.references :team, foreign_key: true, null: false
      t.integer :price, null: false
      t.integer :payment_method, null: false
      t.boolean :payment, null: false, default: false
      t.boolean :confirm, null: false, default: false
      t.timestamps
    end
  end
end
