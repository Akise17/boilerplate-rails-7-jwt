class ChangingForeignKeyOnLents < ActiveRecord::Migration[7.0]
  def change
    change_table :lents do |t|
      t.remove :staffs_id
      t.remove :assets_id
    end
  end
end
