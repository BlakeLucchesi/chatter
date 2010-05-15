require 'test_helper'

class RoomsTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  test "create a new room"
    @room = Room.new({:title => 'New Room', :description => 'This is a room description'})
    assert_true @room.save, 'Cannot create new room.'
  end
end
