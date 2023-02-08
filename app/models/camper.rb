class Camper < ApplicationRecord
    validates :name, :age, presence: true
    validates :age, numericality: { greater_than: 8, less_than: 18 } 

    has_many :signups
    has_many :activities, through: :signups
end
