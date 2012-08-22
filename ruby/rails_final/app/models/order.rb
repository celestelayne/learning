class Order < ActiveRecord::Base
  attr_accessible :customer_id, :name, :price
  belongs_to :customer
end
