class AddingForeignKeyToLents < ActiveRecord::Migration[7.0]
  def change
    add_reference :lents, :staffs, foreign_key: true
    add_reference :lents, :assets, foreign_key: true

  end
end
