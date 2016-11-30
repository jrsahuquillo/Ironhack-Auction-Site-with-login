class UsersController < ApplicationController
  before_action:authenticate_user!

  def index
      @users = User.order(created_at: :desc).limit(10)
  end

  def show
    @user= User.find_by(id: params[:id])
    unless @user
      render "no_users_found"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email])

    if @user.save
      flash[:notice] = "New user added successfully"
      redirect_to "/users/#{@user.id}" #Comillas dobles!!!!
    else
      render "/users/new"
    end
  end

  def destroy
  end

  def profile
    @user = current_user
    render 'users/profile'
  end

end
