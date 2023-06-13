class RemoveUserAddMemberInTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :member, index: true
    remove_reference :tasks, :user, index: true
  end
end
