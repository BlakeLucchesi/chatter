class RoomsController < ApplicationController

  def index
    @rooms = Room.all()
  end
  
  def show
    @room = Room.find(params[:id])
    @message = Message.new
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(params[:room])
    if @room.save
      redirect_to @room
    else
      render :action => "new"
    end
  end

  def update
    @room = Room.find(params[:id])
    @messages = @room.updates(params[:message_id])
    render :partial => @messages
  end

  private
    
    def get_user
      @user = session[:user]
    end
  
end
