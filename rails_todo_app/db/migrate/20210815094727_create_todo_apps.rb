class CreateTodoApps < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_apps do |t|
      t.string :name

      t.timestamps
    end
  end
end
