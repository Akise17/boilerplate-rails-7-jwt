class CreateStaffTable < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email
      t.integer :department
      t.timestamps
    end
  end
end
