require_relative "../app/models/task"
require 'faker'

10.times do
  new_task = Task.new
  new_task.description = Faker::Lorem.sentence
  new_task.complete = false
  new_task.save
end
