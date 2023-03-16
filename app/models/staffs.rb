class Staffs < ApplicationRecord
  has_many :assets
  validates :name, :email, :department, presence: true
  enum department: { hrd: 0, office_manager: 1, backend: 2, front_end: 3, qa_engineer: 4 }
end
