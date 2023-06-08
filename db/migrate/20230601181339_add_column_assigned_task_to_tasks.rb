# frozen_string_literal: true

class AddColumnAssignedTaskToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :assigned_task, :integer
  end
end
