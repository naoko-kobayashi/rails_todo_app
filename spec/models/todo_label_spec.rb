require 'rails_helper'

RSpec.describe TodoLabel, type: :model do
  describe "valid?" do
    subject { todo_label }
    let(:todo_label) { build :todo_label }

    describe ':label' do
      let(:label) { create :label }

      context 'nilの場合' do
        example 'not valid' do
          todo_label.label = nil
          expect(subject).not_to be_valid
        end
      end

      context '存在するlabelを持つ場合' do
        example 'valid' do
          todo_label.label = build(:label)
          expect(subject).to be_valid
        end
      end

      context '存在しないlabelを渡した場合' do
        example 'not valid' do
          todo_label.label_id = label.id + 1
          expect(subject).not_to be_valid
        end
      end
    end

    describe ':todo' do
      let(:todo) { create :todo }

      context 'nilの場合' do
        example 'not valid' do
          todo_label.todo = nil
          expect(subject).not_to be_valid
        end
      end

      context '存在するtodoを持つ場合' do
        example 'valid' do
          todo_label.todo = build(:todo)
          expect(subject).to be_valid
        end
      end

      context '存在しないtodoを渡した場合' do
        example 'not valid' do
          todo_label.todo_id = todo.id + 1
          expect(subject).not_to be_valid
        end
      end
    end
  end
end
