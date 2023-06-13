class AddMemberRefrenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :member, index: true
  end
end
