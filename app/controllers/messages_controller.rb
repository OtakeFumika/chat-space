class MessagesController < ApplicationController
  before_action :find_group

  def index
    @messages = Message.new
  end

  def create
    @group.messages.new(message_params)
    if @group.save
    redirect_to root_path
    else
    render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text,:image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def find_group
    @group = Group.find(params[:group_id]) if params[:group_id]
  end

end
