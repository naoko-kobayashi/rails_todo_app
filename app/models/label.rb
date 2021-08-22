class Label < ApplicationRecord
  has_many :todo_labels
  
  validates :name, presence: true, length: { maximum: 50 }
end
