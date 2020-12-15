class CreateHealths < ActiveRecord::Migration[6.0]
  def change
    create_table :healths do |t|
      t.float      :body_temperature, null: false
      t.integer    :condition_id,     null: false
      t.float      :alcohol_level,    null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
