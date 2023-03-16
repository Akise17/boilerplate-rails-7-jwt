class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :description
      t.string :type
      t.integer :serial_number
      t.integer :status, :default => 1

      t.timestamps
    end
  end
end
