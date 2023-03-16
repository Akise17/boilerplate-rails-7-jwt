class ChangingDescriptionDataType < ActiveRecord::Migration[7.0]
  def change
    change_column(:assets, :description, :text)
  end
end
