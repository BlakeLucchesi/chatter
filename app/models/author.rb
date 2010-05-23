class Author
  include Mongoid::Document

  embedded_in :room, :inverse_of => :authors

  field :name
  
  validates_presence_of :name

end
