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
  index do
    id_column
    column :title
    column :description
    column "Status" do |object|
      object.status
    end
    column "Category" do |object|
      object.category.name   end
    column "status" do |object|
      object.status
    end
    column "Assigned Task" do |object|
      User.find_by(id: object.assigned_task)&.firstname
    end
    column "Approve" do |object|
      object.approve
    end
    actions
  end
end
