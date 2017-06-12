class MessagesController < ApplicationController
before_action :find_group
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to action: :index, notice: "メッセージを送信しました"
    else
      flash[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text,:image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def find_group
    @group = Group.find(params[:group_id])
  end
end
