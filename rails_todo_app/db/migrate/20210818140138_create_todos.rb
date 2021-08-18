class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string  :title
      t.boolean :is_checked
      t.references :todo_app, null: false, foreign_key: true

      t.timestamps
    end
  end
end
