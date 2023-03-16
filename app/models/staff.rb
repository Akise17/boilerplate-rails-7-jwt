class Staff < ApplicationRecord

    has_many :lends
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
    validates :department, presence: true
end
