class MessagesController < ApplicationController
  def index
    @messages = Message.new
    if params[:group_id]
      @group = Group.find(params[:group_id])
    end
  end

  def create
    @messages = Message.new
    binding.pry
    Message.create(text: message_params[:message], group_id: message_params[:group_id], user_id: current_user.id,image: message_params[:image])
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:message,:group_id,:image)
  end
end
