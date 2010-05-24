class RoomsController < ApplicationController

  def index
    @rooms = Room.all()
  end
  
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    redirect_to "/rooms/enter/#{@room.id}" unless ! session[:name].nil?
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

  def updates
    @room = Room.find(params[:id])
    @messages = @room.updates(params[:message_id])
    render :partial => @messages
  end
  
  def enter
    @room = Room.find(params[:id])
    
    if params[:name]
      @room.add_author(params[:name])
      session[:name] = params[:name]
      redirect_to @room
    end
  end
  
  def logout
    session[:name] = nil
    redirect_to :root
  end

end