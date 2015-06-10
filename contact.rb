require 'pg'
require './contact_database'
require 'csv'

class Connection

$conn = PG.connect(
  host: 'localhost',
  dbname: 'contactlist',
  user: 'development',
  password: 'development'
  )
end

class Contact
 
  attr_accessor :firstname, :lastname, :email, :id

  def initialize(firstname, lastname, email, id=nil)
    # TODO: assign local variables to instance variables
    @firstname = firstname
    @lastname = lastname
    @email = email
    @id = id
    
  end


 
  def to_s
    # TODO: return string representation of Contact
      "#{firstname} #{lastname} #{email}"
  end
 
  ## Class Methods
 
  def save!    # TODO: Will initialize a contact as well as add it to the list of contacts
    if !self.id
      $conn.exec_params("INSERT INTO contacts (firstname, lastname, email) VALUES ('#{firstname}','#{lastname}', '#{email}')")
      
    else 
      $conn.exec_params("UPDATE contacts SET firstname = '#{firstname}', lastname = '#{lastname}' WHERE id='#{id}'")
    end

  end

  def destroy
    $conn.exec_params("DELETE FROM contacts WHERE id = #{id}")


  end



  class << self
    
 
    def find_all_by_firstname(firstname)      
      find_anything("firstname", firstname)
      
    end

    def find_all_by_lastname(lastname)
      find_anything("lastname", lastname)
    end

    def find_by_email(email)
      find_anything("email", [0]
    end

    def find_id(id)
      find_anything("id", id)[0]
    end

    def find_anything(column, value)
      pg_item = $conn.exec_params("SELECT * FROM contacts WHERE #{column} = $1", [value])
      to_array(pg_item)
    end


    def all
    pg_result = $conn.exec_params('SELECT * FROM contacts')
    puts pg_result.inspect
    to_array(pg_result)
    end


  end

  private

  def self.to_array(pg_item)
    result = []
    pg_item.each do |row|
      # row {"id"=>"1213", "last_name"=>"Brookins", "first_name"=>"Andrew"}
      
      result << Contact.new(row["firstname"], row["lastname"], row["email"], row["id"])
    end
    result
  end
 
end

# joe = Contact.create("Joe", "joe@joe.com")



# Contact.find("Bob")

# Contact.all


