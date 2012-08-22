class Url < ActiveRecord::Base
  attr_accessible :original_url, :shortened_url, :user_id, :vanity_url
  
  URL_CHECKER = /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/  
  
  validates :original_url, presence: true, format: {with: URL_CHECKER}
  
  # If it has http://, pass normally
  # if it doesn't have http://, stick that shit in there at the beginning, then pass it along.
  
  belongs_to :user

  def shorten_url
    self.shortened_url = Base64.encode64(self.id).chomp
  end

end
