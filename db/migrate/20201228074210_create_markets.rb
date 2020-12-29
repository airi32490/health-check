class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets do |t|
      t.decimal    :nikkei,    null: false, precision: 7, scale: 2
      t.decimal    :ny_dow,    null: false, precision: 7, scale: 2
      t.decimal    :us_dollar, null: false, precision: 6, scale: 3
      t.decimal    :euro,      null: false, precision: 6, scale: 3
      t.decimal    :au_dollar, null: false, precision: 6, scale: 3
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
