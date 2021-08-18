class Todo < ApplicationRecord
  belongs_to :todo_app
  
  validates :title, presence: true, length: { maximum: 50 }
end