class MessagesController < ApplicationController
  def index
    @messages=Message.all
  end
  def  create
    @message = Message.new(message_params)
    @message.save
    redirect_to root_path , notice:'メッセージを保存しました'
    else
      # メッセージが保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
end

