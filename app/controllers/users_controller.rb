class UsersController < ApplicationController
  before_action :move_to_index

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to groups_path
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
      redirect_to new_user_session_path
    end
  end
end
