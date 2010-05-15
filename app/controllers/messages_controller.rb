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
    @room = Room.find("4bee429247a5651708000003")
    params[:message][:author] = "blake"   
    @room.messages.create(params[:message])
    # @room.save
    redirect_to @room
  end
  
end
