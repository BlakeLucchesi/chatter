require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  test "create a new room" do
    @room = Room.new({:title => 'New Room', :description => 'This is a room description'})
    assert @room.save, 'Cannot create new room.'
  end
  
  
end
