class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.create(user_params)
    # return redirect_to(controller: 'users', action: 'new') unless @user.save
    return redirect_to new_user_path unless @user.save
    session[:user_id] = @user.id
    # redirect_to controller: 'users', action: 'new'
    redirect_to new_user_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :password)
  end
  
end