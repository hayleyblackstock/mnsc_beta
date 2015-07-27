class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :address,
                                                  :unit, :city, :state, :zip_code, :entry_code, :bithday,
                                                  :profile_picture, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "You have successfully signed up"
    else
      render :new
    end
  end

end
