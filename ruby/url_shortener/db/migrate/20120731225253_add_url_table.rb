class AddUrlTable < ActiveRecord::Migration
  def change 
    create_table :urls do |t|
      t.string :original_url
      t.string :shortened_url

      t.timestamp
    end
  end
end
