# frozen_string_literal: true

class TasksController < ApplicationController
  # before_action :load_and_authorize_resource param_method: :task_params

  def index
    # byebug
  end

  def show
    @task = Task.where('user_id=?', current_user.id)
    @cat = params[:category_id]
    if @cat.length == 1
    flash[:notice] = 'compalsory to select one check box'
    redirect_to tasks_path
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    # byebug
    if @task.save!
      redirect_to tasks_all_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    # byebug
    return unless @task.update(task_params)

    redirect_to '/tasks/all'
  end

  def destroy
    # byebug
    @task = Task.find(params[:id])

    return unless @task.destroy

    redirect_to '/tasks/all'
  end

  def all
    @tasks = Task.all
  end

  private

  def task_params
    params.require(:task).permit(:id, :title, :description, :status, :category_id, :user_id, :image)
  end
end
