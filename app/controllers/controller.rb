require_relative '../../config/application'

class TaskController
  def self.list
    Task.all.each_with_index do |task, index|
      completed = if task.complete
               "[X]"
             else
              "[ ]"
            end
            puts "#{completed} #{index + 1}. #{task.description}"
      end
  end

  def self.add(desc)
    Task.create(description: desc, complete: false)
  end

  def self.delete(desc)
    task_index = desc.to_i - 1
    raise ArgumentError unless task_index >= 0 && task_index < Task.count
      task = Task.limit(1).offset(task_index).first
      message = "Deleted \"#{task.description}\" from your to-do list."
      task.destroy
      return message
    rescue ArgumentError
      return "Invalid input."
  end

  def self.complete(desc)
    task_index = desc.to_i - 1
    raise ArgumentError unless task_index >=0 && task_index < Task.count
      task = Task.limit(1).offset(task_index).first
      task.complete!
      return "Completed \"#{task.description}\" on your to-do list."
    rescue ArgumentError
      return "Invalid input."
  end

  def self.list_outstanding
    puts "Tasks to complete: "
    Task.where(complete :false).each_with_index do |task, index|
      puts "[ ] #{index + 1}. #{task.description}"
      # puts "Completed at #{task.completion_date}"
    end
  end

  def self.list_completed
    puts "Tasks completed:"
    Task.where(complete :true).each_with_index do |task, index|
      puts "[X] #{index + 1}. #{task.description}"
    end
  end
end