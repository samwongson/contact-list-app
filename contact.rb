require './contact_database'
require 'csv'

class Contact
 
  attr_accessor :name, :email, :phone

  def initialize(name, email, phone)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    @phone = phone
  end
 
  def to_s
    # TODO: return string representation of Contact
      "#{name} #{email}"
  end
 
  ## Class Methods
  class << self
    def create(name, email, p={})
      # TODO: Will initialize a contact as well as add it to the list of contacts
      self.new(name, email, p)
      ContactDatabase.add_contact(name, email, p)
    end


    
 
    def find(name)
      # TODO: Will find and return contact by index
      ContactDatabase.read_contacts.each do |contact|
        if contact.name.match(name) || contact.email.match(name)
          puts contact
        end

      end
    end
   
 
    def all
      # TODO: Return the list of contacts, as is
      index = 1
      ContactDatabase.read_contacts.each do |contact|
        puts "#{index}: #{contact.name} (#{contact.email}) #{contact.phone}"
        index += 1
      end
      
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      ContactDatabase.id_feed(id)
    end
    
  end
 
end

# joe = Contact.create("Joe", "joe@joe.com")



# Contact.find("Bob")

# Contact.all


