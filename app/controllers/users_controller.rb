class UsersController < ApplicationController
  def index
    @users = current_member.users
  end
  def new
    @user=User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'created'
      redirect_to tasks_path
    else
     render :new, status: :unprocessable_entity
    end
  end

  def deleted
    
     @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = 'user deleted'
      redirect_to users_path
    end
end 
      
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :firstname, :lastname).merge!(member: current_member)
  end
       
end
