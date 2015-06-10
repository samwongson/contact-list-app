require_relative 'contact'
require 'pry'
# require_relative 'contact_database'

# class ExistingContactError < StandardError
# end

# def help
#  puts "Here is a list of available commands: 
#     new  - Create a new contact 
#     list - List all contacts
#     show - Show a contact
#     find - Find a contact"
# end

# user_answer = ARGV.first
# second_arg =ARGV[1]

#   case user_answer 
#   when 'help' 
#     help
#   when 'new'

#     puts "What is the contact's email?"
#     email = STDIN.gets.chomp

#     ContactDatabase.read_contacts.each do |contact|
#       if contact.email == email
#         raise ExistingContactError, 'That contact already exists.'
#       end
#     end

#     puts "What is the contact's name?"
#     name = STDIN.gets.chomp

#     puts "How many phone numbers?"
#     phone_hash = {}
#     num_of_ph = STDIN.gets.chomp.to_i
#       if num_of_ph == "0"
#         return
#       else
#         num_of_ph.times do 
#         puts "What kind of phone number is this?"
#         ph_type = STDIN.gets.chomp.to_sym
#         puts "What's the phone number?"
#         num = STDIN.gets.chomp   
#         phone_hash[ph_type] = num
#         end
#       end



#     Contact.create(name, email, phone_hash)
#     puts "#{name} has been added!"

#   when 'list'
#     Contact.all
#   when 'show'
#     Contact.show(second_arg.to_i)
#   when "find"
#     Contact.find(second_arg)
#   else
#     return
#   end
def list
  contacts = Contact.all
  contacts.each do |contact|
  puts "#{contact.id} Name: #{contact.firstname} #{contact.lastname} Email: #{contact.email}"
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

    contact = Contact.new(firstname, lastname, email)
    contact.save!
  else
    puts "Enter ID you want to update"
    id = gets.chomp.to_i

    contact = Contact.find_id(id)[0]
    puts contact
    puts "New name?"
    fn = gets.chomp
    puts "New lastname?"
    ln = gets.chomp
    puts "New email?"
    em = gets.chomp

    contact.firstname = fn
    contact.lastname = ln
    contact.email = em

    contact.save!

  end


end


def find
  puts "Find by ID, firstname, lastname, or email?"
  input = gets.chomp.downcase
  case 
    when input == "id"
      Contact.find_id(input)
    when input == "firstname"
      Contact.find_all_by_firstname(input)
    when input == "lastname"
      Contact.find_all_by_lastname(input)
    when input == "email"
      Contact.find_by_email(input)
    else
      "DONT KNOW"
  end
end

def destroy 
  puts "What ID would you like to destroy? :)"
  id = gets.chomp.to_i

  contact = Contact.find_id(id)
  contact.destroy
end




# list
# create_update
a = Contact.find_id(4)
puts a
# Contact.find_id(4)
contacts = Contact.find_all_by_firstname("Ass")
# binding.pry
puts contacts
# contact = Contact.find_by_email("samson@hotmail.com")
# puts contact

# destroy
# b = Contact.new("jack", "cock", "asd@asdad.com")
# puts b


