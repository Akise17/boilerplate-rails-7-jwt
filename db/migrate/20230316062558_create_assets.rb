class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :serial_number
      t.text :description
      t.integer :status
      t.string :types
      t.references :staffs, foreign_key: true
      t.timestamps
    end
  end
end
