class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
       redirect_to controller: :messages, action: :index
    else
      session[:errors] = @group.errors.full_messages
      render "new"
    end

  end

  def edit
  end

  def update
  end

  private

  def group_params
      params.require(:group).permit(:name, { :user_ids=> [] })
  end
end
