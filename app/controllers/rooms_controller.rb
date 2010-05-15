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
  
end
