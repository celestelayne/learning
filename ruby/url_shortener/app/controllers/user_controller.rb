class UserController < ApplicationController
  
  def new
    @user = User.new
  end

  def create 
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to dA lInK SHorTeNEr"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show 
    @user = User.find(params[:id])
    @user_links = Url.find_all_by_user_id(params[:id])
  end

end
