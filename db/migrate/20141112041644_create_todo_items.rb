class CreateTodoItems < ActiveRecord::Migration
  def change

      create_table :todo_items do |table|
      table.string :description
      table.string :due_date
     end

  end
end
