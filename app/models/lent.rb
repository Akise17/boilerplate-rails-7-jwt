class Lent < ApplicationRecord
  belongs_to :staff, class_name: 'Staff'
  belongs_to :asset, class_name: 'Asset'
end
