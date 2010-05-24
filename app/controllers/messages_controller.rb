class MessagesController < ApplicationController

  def index
    redirect_to :controller => "rooms"
  end
    
  def create
    @room = Room.find(params[:room_id])
    params[:message][:author] = session[:name]
    @message = @room.messages.create(params[:message])
    respond_to do |format|
      format.html { redirect_to @room }
      format.js
    end
  end
  
end
