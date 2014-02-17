class UsersController < ApplicationController
before_filter :login
  def index
 
  end
  def show
  end

  private
  
   def user_params
    params.require(:user).permit(:user_name)
  end
end
