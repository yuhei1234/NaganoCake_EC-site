class CreateDelivers < ActiveRecord::Migration[5.2]
  def change
    create_table :delivers do |t|
      t.integer :customer_id, null: false
      t.string  :name,        null: false
      t.string  :post_number, null: false
      t.string  :address,     null: false
      t.timestamps
    end
  end
end
