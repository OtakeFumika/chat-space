class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    if @group = Group.create(group_params)
       redirect_to controller: :messages, action: :index
    else render "new"
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
