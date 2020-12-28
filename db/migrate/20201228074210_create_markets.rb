class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets do |t|
      t.decimal    :nikkei,    null: false
      t.decimal    :ny_dow,    null: false
      t.decimal    :us_dollar, null: false
      t.decimal    :euro,      null: false
      t.decimal    :au_dollar, null: false
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
