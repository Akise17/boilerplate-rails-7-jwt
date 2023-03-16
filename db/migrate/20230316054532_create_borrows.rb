class CreateBorrows < ActiveRecord::Migration[7.0]
  def change
    create_table :borrows do |t|
      t.references :staffs, foreign_key: true
      t.references :assets, foreign_key: true
      t.timestamps
    end
  end
end
