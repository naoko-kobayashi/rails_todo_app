class Todo < ApplicationRecord
  belongs_to :todo_app
  has_many :todo_labels
  
  validates :title, presence: true, length: { maximum: 50 }
end