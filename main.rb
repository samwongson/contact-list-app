require_relative 'contact'

# require_relative 'contact_database'

# class ExistingContactError < StandardError
# end

def help
  puts "Here is a list of available commands: 
    new  - Create or update a contact
    list - List all contacts
    delete - delete a contact
    find - Find a contact"

  puts "what would you like to do?"
  answer = gets.chomp.downcase

  case
    when answer == "new"
      create_update 
    when answer == "list"
      list
    when answer == "delete"
      destroy
    when answer == "find"
      find
    else
      puts "Sorry I don't understand that, please enter a new command."
      help
  end 
end


def list
  Contact.all.each do |contact|
    p contact
  end
end

def create_update
  print "'New' contact or 'update' existing contact?"
  input = gets.chomp.downcase

  if input == "new"

    puts "Enter first name: "
    firstname = gets.chomp
    puts "Enter last name: "
    lastname = gets.chomp
    puts "Enter email: "
    email = gets.chomp

    Contact.create(firstname: firstname, lastname: lastname, email: email)
    
  else
    puts "Enter ID you want to update"
    id = gets.chomp.to_i

    contact = Contact.find(id)
    puts contact
    puts "New name?"
    fn = gets.chomp
    puts "New lastname?"
    ln = gets.chomp
    puts "New email?"
    em = gets.chomp

    contact.update(firstname: fn, lastname: ln, email: em)
  end


end


def find
  puts "Find by ID, firstname, lastname, or email?"
  input = gets.chomp.downcase
  case 
    when input == "id"
      puts "ID?"
      response = gets.chomp
      p Contact.find(response.to_i)
    when input == "firstname"
      puts "What's the first name?"
      response = gets.chomp
      p Contact.where("firstname = ?", response)
    when input == "lastname"
      puts "What's the last name?"
      response = gets.chomp
      p Contact.where("lastname = ?", response)
    when input == "email"
      response = gets.chomp
      p Contact.where("email = ?", response)
    else
      "DONT KNOW"
  end
end

def destroy 
  puts "What ID would you like to destroy? :)"
  id = gets.chomp.to_i

  contact = Contact.find(id)
  contact.destroy
end

help



# list

# create_update

# list

# destroy

# list
# # a = Contact.find_id(4)
# puts a
# # Contact.find_id(4)
# contacts = Contact.find_all_by_firstname("Ass")
# # binding.pry
# puts contacts
# contact = Contact.find_by_email("samson@hotmail.com")
# puts contact

# destroy
# b = Contact.new("jack", "cock", "asd@asdad.com")
# puts b


