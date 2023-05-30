class TasksController < ApplicationController
    #before_action :load_and_authorize_resource param_method: :task_params

    def index
       # byebug
    end
      
    def show
            @task= Task.where('user_id=?',current_user.id)
            @cat = params[:category_id]
    end
     
    def new
            @task = Task.new 
    end

    def create
           @task= Task.new(task_params)
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
           if @task.update(task_params)
             redirect_to "/tasks/all"
          elsif 
              render :edit
          end
    end

    def destroy   
          #byebug
          @task = Task.find(params[:id])
        
          if @task.destroy
              redirect_to "/tasks/all"
          end
    end

    def all
          @tasks = Task.all
    end
           
private
    def task_params
          params.require(:task).permit(:id, :title, :description, :status, :category_id, :user_id,:image)
    end                
end
