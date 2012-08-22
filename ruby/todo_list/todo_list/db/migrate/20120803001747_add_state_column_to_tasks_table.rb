class AddStateColumnToTasksTable < ActiveRecord::Migration
  def change
    add_column :tasks, :state, :boolean, :default => false
  end
end
