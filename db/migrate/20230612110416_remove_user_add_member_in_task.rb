class RemoveUserAddMemberInTask < ActiveRecord::Migration[7.0]
  def change
     add_reference :tasks, :member
    remove_reference :tasks, :user
  end
end
