class MessagesController < ApplicationController
  def index
    @messages = Message.new
    if params[:group_id]
      @group = Group.find(params[:group_id])
    end
  end

  def create
    Message.create(text: message_params[:text], group_id: message_params[:group_id], user_id: message_params[:user_id],image: message_params[:image])
    binding.pry
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:text,:image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
