class Room
  include Mongoid::Document
  
  field :title
  field :description
  
  embeds_many :messages

  validates_presence_of :title, :description
  validates_format_of :title, :with => /[A-Za-z]/
  validates_format_of :description, :with => /[A-Za-z]/

end
