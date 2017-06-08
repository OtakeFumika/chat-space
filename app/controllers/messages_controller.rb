class MessagesController < ApplicationController
  def index
    @messages = Message.new
    if params[:group_id]
      @group = Group.find(params[:group_id])
    end
  end

  def create
    group = Group.find(params[:group_id])
    group.new(message_params)
    if group.save
    redirect_to root_path
    else
    render :index
  end

  private

  def message_params
    params.require(:message).permit(:text,:image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
