class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body
  field :author, :required => true
  
  embedded_in :room, :inverse_of => :messages

  def created
    self.created_at.strftime("%h %e %I:%M%p") unless self.created_at == nil
  end

end
