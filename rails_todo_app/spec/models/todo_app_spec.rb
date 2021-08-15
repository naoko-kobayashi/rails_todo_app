require 'rails_helper'

RSpec.describe TodoApp, type: :model do
  describe 'valid?' do
    subject { todo_app }

    let(:todo_app) { build :todo_app }

    describe ':name' do
      context '空文字の場合' do
        before { todo_app.name = '' }

        example 'not valid' do
          expect(subject).not_to be_valid
        end
      end

      context '50文字の場合' do
        before { todo_app.name = 'a' * 50 }

        example 'valid' do
          expect(subject).to be_valid
        end
      end

      context '51文字の場合' do
        before { todo_app.name = 'a' * 51 }

        example 'not valid' do
          expect(subject).not_to be_valid
        end
      end
    end
  end
end
