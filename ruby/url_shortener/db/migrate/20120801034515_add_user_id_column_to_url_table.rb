class AddUserIdColumnToUrlTable < ActiveRecord::Migration
  def change
    add_column :urls, :user_id, :int
  end
end
