class SessionsController < ApplicationController
  def new
  end
  
  def create
   # @user = User.find_by(name: params[:name])
    @user = User.find_by(name: params[:user][:name])
    @user = user.try(:authenticate, params[:user][:password])
    # return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end
  
  def destroy
    session.clear
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :password)
  end
  
end