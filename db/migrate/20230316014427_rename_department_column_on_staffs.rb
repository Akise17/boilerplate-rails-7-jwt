class RenameDepartmentColumnOnStaffs < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :staffs, :departement, :department
  end
end
