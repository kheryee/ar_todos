require_relative 'config/application'
require_relative 'app/controllers/controller'


input = ARGV
option = input[0]

case option
  when "list"
    TaskController.list
  when "listby"
    TaskController.list_outstanding
    TaskController.list_completed
  when "complete"
    TaskController.complete(input[1])
  when "delete"
    TaskController.delete(input[1])
  when "add"
    TaskController.add(input[1..-1].join(" "))
  when nil
    puts "To get a list of tasks, key in 'list'"
    # puts "To get lists of incomplete and completed tasks, key in 'listby'."
    puts "To tick the task that you have just completed, key in 'complete' along with the number of task."
    puts "To add a new task, key in 'add' along with your new task description."
    puts "To delete a task, key in 'delete' along with the number of task."
  else
    puts "Wrong input."
  end
