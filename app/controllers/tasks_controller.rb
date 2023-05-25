class TasksController < ApplicationController
    def index

    end
     
    def show
         @task= Task.where('user_id=?',current_user.id)
         @cat=params[:category]
     end
     
     def new
      
       @task = Task.new 
     end
     def create
        @task = Task.new(task_params)
        if @task.save
         redirect_to task_all_path
        elsif 
            render :new
        end 
    end
    def edit
        @task = Task.find(params[:id])
    end
    def update
        if @task.update([task_params])
           redirect_to :task_all_path
        elsif 
            render :edit
        end
    end
    def destroy   
     @task= Task.find(params[:id])
        if @task.destroy
          redirect_to :task_all_path
        end
    end

    def all
     @tasks = Task.all
    end
           
private
  def task_parmas
      params.require(:task).permit(:id,:title,:description,:status,:category,:user_id)
   end                
end
