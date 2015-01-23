require_relative '../../config/application'

class Task < ActiveRecord::Base
  def complete!
    self.complete = true
    self.completion_date = Date.today
    self.save
  end
end
