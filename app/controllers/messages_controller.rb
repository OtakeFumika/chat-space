class MessagesController < ApplicationController
  def index
    @messages = Message.new
    if params[:group_id]
      @group = Group.find(params[:group_id])
    end
  end

  def create
    group = Group.find(params[:group_id])
    group.messages.create(message_params)
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:text,:image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
