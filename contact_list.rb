require_relative 'contact'
require_relative 'contact_database'

class ExistingContactError < StandardError
end

def help
 puts "Here is a list of available commands: 
    new  - Create a new contact 
    list - List all contacts
    show - Show a contact
    find - Find a contact"
end

user_answer = ARGV.first
second_arg =ARGV[1]

  case user_answer 
  when 'help' 
    help
  when 'new'

    puts "What is the contact's email?"
    email = STDIN.gets.chomp

    ContactDatabase.read_contacts.each do |contact|
      if contact.email == email
        raise ExistingContactError, 'That contact already exists.'
      end
    end

    puts "What is the contact's name?"
    name = STDIN.gets.chomp

    puts "How many phone numbers?"
    phone_hash = {}
    num_of_ph = STDIN.gets.chomp.to_i
      if num_of_ph == "0"
        return
      else
        num_of_ph.times do 
        puts "What kind of phone number is this?"
        ph_type = STDIN.gets.chomp.to_sym
        puts "What's the phone number?"
        num = STDIN.gets.chomp   
        phone_hash[ph_type] = num
        end
      end



    Contact.create(name, email, phone_hash)
    puts "#{name} has been added!"

  when 'list'
    Contact.all
  when 'show'
    Contact.show(second_arg.to_i)
  when "find"
    Contact.find(second_arg)
  else
    return
  end



