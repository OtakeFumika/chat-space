class UsersController < ApplicationController
  before_action :move_to_index

  def edit
  end

  def update
    user = current_user
    if user.update(user_params)
      redirect_to controller: :messages, action: :index
    else
      render "edit"
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to controller: :messages,action: :index
    end
  end
end
