class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body
  field :author, :required => true
  
  embedded_in :room, :inverse_of => :messages

end
