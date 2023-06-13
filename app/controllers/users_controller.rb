class UsersController < ApplicationController
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

  def destroy
    @user=User.find(params[:id])
    return unless @user.destroy
    redirect_to tasks_path
  end
    
      
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :firstname, :lastname).merge!(member: current_member)
  end
       
end
