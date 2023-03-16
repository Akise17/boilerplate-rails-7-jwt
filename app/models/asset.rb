class Asset < ApplicationRecord
  has_many :lents
  has_many :borrows

  validates :name, :description, presence: true
  validates_uniqueness_of :serial_number

  enum status: {
    available: 1,
    lent: 2,
    under_repair: 3
  }

  enum type: {
    hardware: 1,
    software: 2
  }

end
