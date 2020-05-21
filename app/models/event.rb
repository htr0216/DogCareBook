class Event < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  
  belongs_to :user

  enum category: {
    health: "Health",
    food: "Food",
    medicine: "Medicine",
    hospital: "Hospital"
}
end
