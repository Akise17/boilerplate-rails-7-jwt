class ChangeTypeDataTypeOnAssets < ActiveRecord::Migration[7.0]
  def change
    change_table :assets do |t|
      t.remove :type
      t.integer :type
    end
  end
end
