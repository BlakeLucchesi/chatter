class Message
  include Mongoid::Document

  field :body
  field :author, :required => true
  
  embedded_in :room, :inverse_of => :messages

end
