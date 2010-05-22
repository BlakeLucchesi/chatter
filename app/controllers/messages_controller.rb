class MessagesController < ApplicationController

  def index
    redirect_to :controller => "rooms"
  end
  
  def recent
    @messages = Message.criteria.limit(50).all
  end

  def new
    @message = Message.new
  end
  
  def create
    @room = Room.find(params[:room_id])
    params[:message][:author] = "blake"   
    @message = @room.messages.create(params[:message])
    respond_to do |format|
      format.html { redirect_to @room }
      format.js
    end
  end
  
end
