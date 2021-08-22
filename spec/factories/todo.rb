FactoryBot.define do
  factory :todo do
    title { 'title1' }
    is_checked { false }
    todo_app
  end
end
