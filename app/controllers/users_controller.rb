class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to current_user, notice: 'Account was updated'
    else
      render :edit
    end
  end
end
