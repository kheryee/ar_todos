require_relative '../../config/application'

class CreateToDo < ActiveRecord::Migration
  def change
    create_table :tasks do |y|
      y.string :description
      y.boolean :complete
      y.date :completion_date
      y.timestamps
    end
  end
end


