# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :auth_user
  before_action :set_task, only: %i[edit show update destroy]

  def index
    
    @tasks = current_member.tasks if current_member
    @tasks = current_user.tasks if current_user
  end

  def show
    @cat = params[:category_id]
    authorize! :read , @task
  end

  def new
    @task = Task.new
    authorize! :create, @task
  end

  def create
    @task = Task.new(task_params)
    authorize! :create, @task
    if @task.save
      redirect_to tasks_path
      flash[:notice] = 'created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    
    if @task.update(update_params)
    @task.update(approve: :not_approve) if @task.status == 'Completed' && !@task.approve?
    redirect_to '/tasks'
    flash[:notice] = 'updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! :destroy, @task
    return unless @task.destroy
    redirect_to tasks_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:id,:title, :description, :status, :category_id, :image).merge!(member: current_member)
  end

  def update_params
    params.require(:task).permit(:status, :approve, :user_id)
  end

  def auth_user
    unless  current_user ||  current_member
      authenticate_user!
    end
  end
end
