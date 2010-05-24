class Room
  include Mongoid::Document
  include Mongoid::Timestamps
    
  field :title
  field :description
  field :authors, :type => Array
  
  embeds_many :messages
  
  validates_presence_of :title, :description
  validates_format_of :title, :with => /[A-Za-z]/
  validates_format_of :description, :with => /[A-Za-z]/

  after_create :add_welcome

  def updates(message_id)
    messages = []
    self.messages.each do |message|
      messages.push(message) unless message.id <= message_id
    end
    messages;
  end 

  def add_welcome
    defaults = {:author => "ChitChat Team", :body => "Welcome to your new chatroom"}
    self.messages.create(defaults)
    self.authors = []
  end

  def add_author(name)
    if self.authors.is_a?Array
      self.authors.push(name)
    else
      self.authors = ["#{name}"]
    end
    self.save
  end

end
