class AddColumnApproveToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :approve, :integer
  end
end
