class TasksTable < ActiveRecord::Migration
 def change
   create_table :tasks do |t|
    t.string :content
    t.integer :priority
    t.date :due_date
    t.integer :list_id
    
    t.timestamps
   end
   
 end
end
