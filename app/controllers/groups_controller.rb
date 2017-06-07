class GroupsController < ApplicationController

  before_action :edit_group, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
       flash[:notice] = "グループを作成しました"
       redirect_to root_path
    else
      session[:errors] = @group.errors.full_messages
      render :new
    end

  end

  def edit
  end

  def update
    if @group.update(group_params)
       flash[:notice] = "グループを更新しました"
       redirect_to root_path
    else
      session[:errors] = @group.errors.full_messages
      render :update
    end
  end

  private

  def group_params
      params.require(:group).permit(:name, { user_ids:[] })
  end

  def edit_group
    @group = Group.find(params[:id])
  end
end
