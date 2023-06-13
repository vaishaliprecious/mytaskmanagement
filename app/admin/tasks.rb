# frozen_string_literal: true

ActiveAdmin.register Task do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :status, :user_id, :category_id, :approve
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :status, :category, :user_id, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # index do
  #   id_column
  #   column :title
  #   column :description
  #   column 'Status', &:status
  #   column 'Category' do |object|
  #     object.category.name
  #   end
  #   column 'status', &:status
  #   column 'Assigned Task' do |object|
  #     User.find_by(id: object.assigned_task)&.firstname
  #   end
  #   column 'Approve', &:approve
  #   actions
  # end

  form do |f|
    f.inputs do
      f.input :member, collection: Member.all.map { |t| [t.email ,t.id] }
      f.input :category
      f.input :title
      f.input :description
      f.input :status
      f.input :assigned_task, as: :select, collection: User.all.collect {|user| [user.email, user.id] }
      f.input :approve
    end
    f.actions
  end

end
