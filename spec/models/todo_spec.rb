require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'valid?' do
    subject { todo }

    let(:todo) { build :todo }

    describe ':title' do
      context '空文字の場合' do
        before { todo.title = '' }

        example 'not valid' do
          expect(subject).not_to be_valid
        end
      end

      context '50文字の場合' do
        before { todo.title = 'a' * 50 }

        example 'valid' do
          expect(subject).to be_valid
        end
      end

      context '51文字の場合' do
        before { todo.title = 'a' * 51 }

        example 'not valid' do
          expect(subject).not_to be_valid
        end
      end
    end

    describe ':todo_app' do
      let(:todo_app) { create :todo_app }

      context 'nilの場合' do
        example 'not valid' do
          todo.todo_app = nil
          expect(subject).not_to be_valid
        end
      end

      context '存在するtodo appを持つ場合' do
        example 'valid' do
          todo.todo_app = build(:todo_app)
          expect(subject).to be_valid
        end
      end

      context '存在しないtodo appを渡した場合' do
        example 'not valid' do
          todo.todo_app_id = todo_app.id + 1
          expect(subject).not_to be_valid
        end
      end
    end
  end
end
