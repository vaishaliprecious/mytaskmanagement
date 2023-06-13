# frozen_string_literal: true

ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :firstname, :lastname
  #
  # or
  #
  # permit_params do
  #   permitted = %i[email encrypted_password reset_password_token reset_password_sent_at remember_created_at
  #                  firstname lastname]
  #   permitted << :other if params[:action] == 'create' && current_user.admin_user_id?
  #   permitted
  # end
  permit_params :email, :password, :password_confirmation, :admin_user_id,:firstname, :lastname, :member_id

  index do
    selectable_column
    id_column
    column :email
    column :firstname
    column :lastname
    column :member
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :firstname
      f.input :lastname
      f.input :member, collection: Member.all.collect {|m| [m.email, m.id] }
    end
    f.actions
  end
end
