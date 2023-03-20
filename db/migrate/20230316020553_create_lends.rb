class CreateLends < ActiveRecord::Migration[7.0]
  def change
    create_table :lends do |t|
      t.references :staff, null: false, foreign_key: true
      t.references :asset, null: false, foreign_key: true
      t.string :lend_status
      t.datetime :lended_at
      t.timestamps
    end
  end
end
