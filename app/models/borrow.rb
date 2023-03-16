class Borrow < ApplicationRecord
  belongs_to :staff,  class_name: 'Staff'
  belongs_to :asset,  class_name: 'Asset'

  validatable :staff_id, :asset_id, presence: true
end
