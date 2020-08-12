class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,             null: false
      t.text    :detail,           null: false
      t.string  :rental_period,    null: false
      t.integer :price,            null: false
      t.string  :image,            null: false
      t.integer :postcode,         null: false
      t.string  :address_region,   null: false
      t.string  :trading_status,   null: false
      t.timestamps
    end
  end
end
