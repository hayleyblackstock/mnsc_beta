class UsersController < ApplicationController
  before_action :authenticate

def index
  @users = User.all
end

def new
  @user = User.new
end

def create
  @user = User.create(user_params)
  if @user.save
    redirect_to users_path
  else
    render 'new'
  end
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
  redirect_to users_path, notice: "Member was updated successfully!"
  end
end

def edit
  @user = User.find(params[:id])
end

def show
  @user = User.find(params[:id])
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to users_path, notice: "Member was deleted!"

end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :phone_number, :address, :unit, :city, :state, :zip_code, :entry_code, :email, :birthday, :profile_picture, :auth_token, :password, :password_confirmation)
end


end
