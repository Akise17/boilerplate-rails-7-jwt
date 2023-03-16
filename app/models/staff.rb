class Staff < ApplicationRecord
  has_many :lents
  has_many :borrows

  validates :email, :department, presence: true
  validates_uniqueness_of :name

  def total_lents
    lents.count
  end
end
