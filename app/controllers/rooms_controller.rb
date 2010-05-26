class RoomsController < ApplicationController

  # List rooms.
  def index
    @rooms = Room.all()
  end
  
  # Show the chatroom.
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    if (session[@room.id].nil?)
      redirect_to "/rooms/enter/#{@room.id}"
    else
      render :layout => 'fluid'
    end
  end

  # Create a new chat room.
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(params[:room])
    if @room.save
      redirect_to @room
    else
      flash[:notice] = "Could not create chat room. Please complete the form."
      render :action => "new"
    end
  end

  # Return recent messages for a chat room.
  def updates
    @room = Room.find(params[:id])
    @messages = @room.updates(params[:message_id])
    render :partial => @messages
  end

  # Prompt the user for a username and optionally the chat room password.
  def enter
    @room = Room.find(params[:id])
    
    # post
    if params[:name].nil?
      flash[:notice] = "Please enter your name."
      return
    end
    
    if @room.private && ! @room.check_password(params[:password])
      flash[:notice] = "Please enter the correct password."
      return
    end
    
    @room.add_author(params[:name])
    session[@room.id] = {:name => params[:name]}
    redirect_to @room
  end
  
  # Unset the user's session data for the room.
  def logout
    @room = Room.find(params[:id])
    session[@room.id] = nil
    redirect_to :root
  end

end