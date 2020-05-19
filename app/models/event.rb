class Event < ApplicationRecord
  belongs_to :user

  enum category: {
    health: "Health",
    food: "Food",
    medicine: "Medicine",
    hospital: "Hospital"
}
end
