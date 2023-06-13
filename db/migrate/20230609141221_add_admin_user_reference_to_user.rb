class AddAdminUserReferenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :admin_user, index: true
  end
end
