# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ edit show update destroy]

  def index
    @tasks = Task.where(assigned_task: nil).or(Task.where(status: "Complete")) if current_user.admin?
    @tasks = Task.where(assigned_task: current_user.id) unless current_user.admin?
  end

  def show
    @cat = params[:category_id]
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
      flash[:notice] = "created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if  @task.update(task_params)
      @task.update(approve: :not_approve) if  @task.status == 'Completed' && !@task.approve?
      redirect_to '/tasks'
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless @task.destroy
    redirect_to tasks_path
  end

  def set_task
    @task = Task.find(params[:id])
  end
  
  private
  def task_params
    params.require(:task).permit(:id, :title, :description, :status, :category_id, :image, :assigned_task, :approve).merge!(user:current_user)
  end
end
