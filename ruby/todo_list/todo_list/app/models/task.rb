class Task < ActiveRecord::Base
  attr_accessible :content, :priority, :due_date,  :state
  belongs_to :list
end
