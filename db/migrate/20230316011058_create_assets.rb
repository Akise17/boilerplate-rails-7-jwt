class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :description
      t.string :type
      t.string :serial_number
      t.string :status
      t.timestamps
    end
  end
end
