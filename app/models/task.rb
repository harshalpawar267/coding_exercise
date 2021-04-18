class Task < ActiveRecord::Base

  enum status: [:backlog, :inprogress, :done]
  
  # Associations
  belongs_to :user

end
