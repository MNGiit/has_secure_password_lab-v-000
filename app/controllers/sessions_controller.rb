class SessionsController < ApplicationController
  def new
  end
  
  def create
    # post :create, params: { user: {name: connie.name, password: connie.password} }
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    # redirect_to(controller: "welcome", action: "home")
  end
  
  def destroy
    session.clear
  end
  


  private
  
  def user_params
    params.require(:user).permit(:name, :password)
  end
  
end