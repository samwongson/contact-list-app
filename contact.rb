require './contact_database'
require 'csv'

class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
 
  def to_s
    # TODO: return string representation of Contact

  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      self.new(name, email)
      ContactDatabase.add_contact(name, email)
    end


    
 
    def find(index)
      # TODO: Will find and return contact by index
    end
 
    def all
      # TODO: Return the list of contacts, as is
      ContactDatabase.read_contacts.inspect

    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      ContactDatabase.id_feed(id).inspect
    end
    
  end
 
end

# joe = Contact.create("Joe", "joe@joe.com")

puts Contact.all


