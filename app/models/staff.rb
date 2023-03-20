class Staff < ApplicationRecord

    has_many :lends
    validates :email, presence: true, uniqueness: true,  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "invalid email" }
   
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,message: "only allows letters" }
    validates :department, presence: true
end
